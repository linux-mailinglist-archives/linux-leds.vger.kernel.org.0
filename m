Return-Path: <linux-leds+bounces-6875-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPOUC1hyhmlINQQAu9opvQ
	(envelope-from <linux-leds+bounces-6875-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 23:59:36 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B737F104001
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 23:59:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0398D3060286
	for <lists+linux-leds@lfdr.de>; Fri,  6 Feb 2026 22:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA3A311C30;
	Fri,  6 Feb 2026 22:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VycR36+k"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4324030E831;
	Fri,  6 Feb 2026 22:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770418720; cv=none; b=cvH6AnL5pWjkQDZjFzMCnM5ZcO3BRuDIiRdGnTzS3nhcgluTbxtVGfwepIJIKCLeMmNG5Zf1gL0arhsSKVHgi/D3ldn4F/j7O3NzQyhhZp3JCgjnJFguxhhHwLjDzJI5i6c3gXqJTldYxLnpodEs4eUW6L7OmGwb9kxcR1mETjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770418720; c=relaxed/simple;
	bh=egEYJ3n0I7taESG2bPLRcqTuY5ecBD0jiqmyD21eZuo=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=st+SbubyOeJE+JX6ywBmwviIS3gk9GSWCBmm5u5q/5wBhstr7TeMegn07J3lKsRUMU7M+T98nJY61WgN8e4cBqAOTPuWuXPWAFSJR3ozSYawbzQexBUJfGD6NnOy2soEdJ3+INNiYY10JQNyWXpWERZoXcKld8xuGPDfmGjS6+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VycR36+k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E88C116C6;
	Fri,  6 Feb 2026 22:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770418720;
	bh=egEYJ3n0I7taESG2bPLRcqTuY5ecBD0jiqmyD21eZuo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=VycR36+kpQuFi4oovWJ+Ed+0OSQO42uy6DQngltgESWBdj53hHwWcse0MkrDRCAPK
	 beflN3N1k/qg18Du4HF1c+s8SG4q8OrwEy4feGyUrFGoIOKc0KStxFHDFFWBWaHbPz
	 H03f4SpYzWyn2o928R0wjH9khrTWyLhFwJqUEU/Zq5UTDhvmur10he6qBzqdQsaOLb
	 HWOgAFWbWhUJ7+/3I0Nf7u88xQ8Et/Uw9lYJUDTXF/ddNUF0Etuv3w0osXmDMnwMU7
	 Pp1BAlM2rs4htL5n8XeTSUsKC7KODG/E42BEfKoeRYkxzqYyAXoI26j0E/I6A6i4ne
	 spSnYcIzXewxw==
Date: Fri, 06 Feb 2026 16:58:37 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andy Shevchenko <andy@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 Dixit Parmar <dixitparmar19@gmail.com>, Lee Jones <lee@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 linux-iio@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20260206172845.145407-8-clamor95@gmail.com>
References: <20260206172845.145407-1-clamor95@gmail.com>
 <20260206172845.145407-8-clamor95@gmail.com>
Message-Id: <177041871054.250183.16012667487427098992.robh@kernel.org>
Subject: Re: [PATCH v2 07/11] dt-bindings: input: cpcap-pwrbutton: convert
 to DT schema
X-Rspamd-Server: lfdr
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6875-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,atomide.com,vger.kernel.org,baylibre.com,analog.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B737F104001
X-Rspamd-Action: no action


On Fri, 06 Feb 2026 19:28:41 +0200, Svyatoslav Ryhel wrote:
> Convert power button devicetree bindings for the Motorola CPCAP MFD from
> TXT to YAML format. This patch does not change any functionality; the
> bindings remain the same.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
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

See https://patchwork.kernel.org/project/devicetree/patch/20260206172845.145407-8-clamor95@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


