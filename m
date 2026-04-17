Return-Path: <linux-leds+bounces-7767-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJn0Lvmr4mlk8wAAu9opvQ
	(envelope-from <linux-leds+bounces-7767-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 23:54:01 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D1E41EC5F
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 23:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 07A5B306BFC8
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 21:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4543E36EA9E;
	Fri, 17 Apr 2026 21:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hqiW5PLi"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208671C84BC;
	Fri, 17 Apr 2026 21:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776462839; cv=none; b=M66oWMEYMW0wAVv75XGwSoLuRaFqkcvHXG/5eliH3o/joxxcV3/RecjXg3n3wXqDSKRlkDNZ8AUlWQOJCjS6syGMJWWtBOOcNpWwstt1Lw9sfrGykEV4+olOntMDWet29nHzqyemG9zWJ8/9AMZpHFov642cJ2gU0AkDHzR+3pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776462839; c=relaxed/simple;
	bh=uVTuxpQxIDpJu7WeDd9lSdSOMBR4riVzt1I5XLYlxc0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=VvvOYsbNDW17+MY/LYlwJ8mHsjU+NaEZxqL3Z9tnnt3+jjZGd7u09KEA9mPYme6nXW6oW98q2R+I5/L/65YeQlSvqo8ZpUY5X2Z2Au/R2AIj6FHOn0wMQA8G964/lEhxA1GJjuwN1Vj46XpPALTwKoej1Lgp/eA2/xumazmmcBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hqiW5PLi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84259C19425;
	Fri, 17 Apr 2026 21:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776462838;
	bh=uVTuxpQxIDpJu7WeDd9lSdSOMBR4riVzt1I5XLYlxc0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=hqiW5PLi2p3inHa3rS9Ox41DVoU0iD71mBgQGegUyQWWpXptNrzBCjhi5vID0AEdj
	 IVkxpumqV0Tc1y1tQjFWF6Wc7JWNmKXO4/7JBGGJsyHHTabBZjy0RAxGrScyI0ac7W
	 4HLupxszJrx6ItomNjmspBkabfznih6c43lhHTo0M3qijMH6zOK27BqqTDn8soR1ny
	 htp8PPrJqKZvlXnAPLuEHteVca4b481mqNRaFAeL5PFsfoOoVY6AIbxqZ7+iL4dczB
	 yvnL6+qynF2vjUx9opNwVxkMnTZhdoQVUFUaOOhZfO5UTzf95mrKAedHipJ8G7RtRn
	 R46SS5ci8hxNA==
Date: Fri, 17 Apr 2026 16:53:56 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-input@vger.kernel.org, Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 Pavel Machek <pavel@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20260417071106.21984-2-clamor95@gmail.com>
References: <20260417071106.21984-1-clamor95@gmail.com>
 <20260417071106.21984-2-clamor95@gmail.com>
Message-Id: <177646283565.2491850.7304841770504122660.robh@kernel.org>
Subject: Re: [PATCH v4 1/6] dt-bindings: leds: leds-cpcap: convert to DT
 schema
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7767-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,baylibre.com,atomide.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 38D1E41EC5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 17 Apr 2026 10:11:01 +0300, Svyatoslav Ryhel wrote:
> Convert LEDs devicetree bindings for the Motorola CPCAP MFD from TXT to
> YAML format. This patch does not change any functionality; the bindings
> remain the same.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/leds/leds-cpcap.txt   | 29 -------------
>  .../bindings/leds/motorola,cpcap-leds.yaml    | 42 +++++++++++++++++++
>  2 files changed, 42 insertions(+), 29 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/leds/leds-cpcap.txt
Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
Documentation/devicetree/bindings/mfd/motorola-cpcap.txt: Documentation/devicetree/bindings/leds/leds-cpcap.txt

See https://patchwork.kernel.org/project/devicetree/patch/20260417071106.21984-2-clamor95@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


