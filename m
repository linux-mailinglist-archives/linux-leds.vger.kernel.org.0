Return-Path: <linux-leds+bounces-7893-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMrvM97s8GmBbAEAu9opvQ
	(envelope-from <linux-leds+bounces-7893-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 19:22:38 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C70489D8A
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 19:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 242B73079CEB
	for <lists+linux-leds@lfdr.de>; Tue, 28 Apr 2026 17:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B563BD63B;
	Tue, 28 Apr 2026 17:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGKS+R63"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431963BAD84;
	Tue, 28 Apr 2026 17:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777396549; cv=none; b=oBPJRIlRyWBY2ibCeyYhRkeisIZhyNMSBj5A8iyiL87XY3le2j+m/K7YvemUTgyhdBvG5gfNDjc83jfz+cL0TYa4BEumeoxDF2I/R+mtV6zqeaUHMHviT1SzsY4kI4AiwAETQ2JW7HaW7Ai/38z3tbl3SL9LipTPlYRr7xmoI8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777396549; c=relaxed/simple;
	bh=E8RdRF+gxIx4Gk3EtoQmTVD6jS7YsHaxm0T9eSruWzg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=HvrCEsaiibxW7jJu+IBjKhKO7ohX4VI2GX/IUsG80ie/gBcoC4h6x5Uut+Aq3F+4Vv44/SvMNjgIZ+SpZB/jI5riJvxd6Ou3ifpnA4DvJP3MzZUyG/PQR181392ed36ImgDqp01bmKmR7pBYGoTtZds4BfqkN2SykdQNZqc60Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dGKS+R63; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCA80C2BCB5;
	Tue, 28 Apr 2026 17:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777396549;
	bh=E8RdRF+gxIx4Gk3EtoQmTVD6jS7YsHaxm0T9eSruWzg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=dGKS+R63Kf53c4AQo2BBQn1xqsgPFvqBT3qhRws+CX3Upxk6yN3YdWBxpWTJAkLGf
	 2duh40KAWlhkqX6zCXOP9agL9C76Gt9PLNcqBThhDfN53XltorRpEzySwb8sW6AnTc
	 pV6SNfit8NzIuWg+0x0FiS5J99zaPvkZAEfsIPlCl/eOc8N3CoJ9++zctQB/B96snx
	 ncza+HsBURYG5U127pOCkpzSf6qnDUCleHCXnh/Vxz2GqR2LZVi6LQ0Hsx4koqvHCt
	 HewlY/0Xpk7vI2n4aPlMnpiVupM5Eo8Mmj3UCJ7rdj2zGG5uUptwLpdnRKMcFAnqQT
	 iwobtC1lLTafQ==
Date: Tue, 28 Apr 2026 12:15:46 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>, 
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20260428153611.142816-2-clamor95@gmail.com>
References: <20260428153611.142816-1-clamor95@gmail.com>
 <20260428153611.142816-2-clamor95@gmail.com>
Message-Id: <177739654562.2299181.14465325821449939513.robh@kernel.org>
Subject: Re: [PATCH v4 1/6 RESEND] dt-bindings: leds: leds-cpcap: convert
 to DT schema
X-Rspamd-Queue-Id: 69C70489D8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7893-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,baylibre.com,atomide.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]


On Tue, 28 Apr 2026 18:36:06 +0300, Svyatoslav Ryhel wrote:
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

See https://patchwork.kernel.org/project/devicetree/patch/20260428153611.142816-2-clamor95@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


