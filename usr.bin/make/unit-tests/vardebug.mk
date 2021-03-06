# $NetBSD: vardebug.mk,v 1.1 2020/07/25 21:19:29 rillig Exp $
#
# Demonstrates the debugging output for var.c.

RELEVANT=	yes

VAR=		added		# VarAdd
VAR=		overwritten	# Var_Set
.undef VAR			# Var_Delete (found)
.undef VAR			# Var_Delete (not found)

# The variable with the empty name cannot be set at all.
${:U}=		empty name	# Var_Set
${:U}+=		empty name	# Var_Append

FROM_CMDLINE=	overwritten	# Var_Set (ignored)

VAR=		1
VAR+=		2
VAR+=		3

.if ${VAR:M[2]}			# VarMatch
.endif
.if ${VAR:N[2]}			# VarNoMatch (no debug output)
.endif

.if ${VAR:S,2,two,}		# VarGetPattern
.endif

.if ${VAR:Q}			# VarQuote
.endif

.if ${VAR:tu:tl:Q}		# ApplyModifiers
.endif

.undef ${:UVAR}			# Var_Delete

RELEVANT=	no

all:
	@:
