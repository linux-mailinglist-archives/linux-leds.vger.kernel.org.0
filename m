Return-Path: <linux-leds+bounces-7768-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOuSAhys4mlk8wAAu9opvQ
	(envelope-from <linux-leds+bounces-7768-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 23:54:36 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F88A41EC89
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 23:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2792308F073
	for <lists+linux-leds@lfdr.de>; Fri, 17 Apr 2026 21:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C0937DEAB;
	Fri, 17 Apr 2026 21:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EWSZmOXW"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55A933D6FC;
	Fri, 17 Apr 2026 21:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776462841; cv=none; b=gVQjITvz5nfCs0zxP8ipO5TU2kUU4+64k80B75VeWoGIlVp/UqJXaPeorJva46bmFrHwE4XEhThuigh4WTczGt/8kVdmtZcp/faJU++yrGhAxeHjpqdneqAMyhR1I8tH9wrvwxDuPtWxJ06xTotoa6p8CDA673SWWIkUgRVweYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776462841; c=relaxed/simple;
	bh=E+jxqs8F9ufMGOmh/Ivt/Xyd1sQx1Pm/CicD6O3g26c=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ewiL31pcImXmfvd09ucbRHMI6wo9en2uJxcrHTwfh6jMHoTwyYvFVgEy30VlvIS4CvwcKV2Pc2+00FbcKkiJq1ZcV76fRqiP9JbpElc3LNwFcM0ad9IKclRXo07wF7zDk3Qi4CkQKP9Ml5s0VrDAis5HIZ2YjR9crtu/2WpGYhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EWSZmOXW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED905C2BCB0;
	Fri, 17 Apr 2026 21:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776462840;
	bh=E+jxqs8F9ufMGOmh/Ivt/Xyd1sQx1Pm/CicD6O3g26c=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=EWSZmOXW+LHkNMWHhanXnazK/6BnISpAXIz/DrfkdBb3OUq4QR75M3+Iu3nUx4Rre
	 sxZbovRXwr//j+UHzUK+Cab6bYR2ZPEqlpNX0a65Q6cRL49TZbUozKE+BC92WGQdP6
	 tuCPENQ2ZpXmabBpJWrG04rgduK2EvULWtmXQQdPYMQykuP7Y07yVALf9xS4uHnNUD
	 mXJrTOxjWtVCryG6iQhKd61Uf9aWmafs+0UDBO7XGi1+mL0iHcGWWvwBucsj/AL/Mm
	 QKZJkShUF3s2xCjTDpCdm3A6Tzx65oxGbUU1I0cpzmAOLUnY+nWU6nQQ2BGYwN73in
	 tciGDSGKfhnHQ==
Date: Fri, 17 Apr 2026 16:53:58 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>, Pavel Machek <pavel@kernel.org>, 
 devicetree@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20260417071106.21984-3-clamor95@gmail.com>
References: <20260417071106.21984-1-clamor95@gmail.com>
 <20260417071106.21984-3-clamor95@gmail.com>
Message-Id: <177646283671.2492094.16417574111285272935.robh@kernel.org>
Subject: Re: [PATCH v4 2/6] dt-bindings: input: cpcap-pwrbutton: convert to
 DT schema
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[atomide.com,kernel.org,vger.kernel.org,baylibre.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-7768-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5F88A41EC89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 17 Apr 2026 10:11:02 +0300, Svyatoslav Ryhel wrote:
> Convert power button devicetree bindings for the Motorola CPCAP MFD from
> TXT to YAML format. This patch does not change any functionality; the
> bindings remain the same.
> 
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/input/cpcap-pwrbutton.txt        | 20 ------------
>  .../input/motorola,cpcap-pwrbutton.yaml       | 32 +++++++++++++++++++
>  2 files changed, 32 insertions(+), 20 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
>  create mode 100644 Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
Documentation/devicetree/bindings/mfd/motorola-cpcap.txt: Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt

See https://patchwork.kernel.org/project/devicetree/patch/20260417071106.21984-3-clamor95@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


