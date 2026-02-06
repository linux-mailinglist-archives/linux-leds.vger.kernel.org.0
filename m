Return-Path: <linux-leds+bounces-6874-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDvHEyNyhmlINQQAu9opvQ
	(envelope-from <linux-leds+bounces-6874-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 23:58:43 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0471B103FAE
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 23:58:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F0E43046DE6
	for <lists+linux-leds@lfdr.de>; Fri,  6 Feb 2026 22:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD18311C1D;
	Fri,  6 Feb 2026 22:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aoT5+eL4"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBACC30F7E3;
	Fri,  6 Feb 2026 22:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770418718; cv=none; b=bBrRbx24kVlov1IzRUa/rrEQH/dxxKrHGWI5RkL0Ff3ZFpQbo3Rlzr66k2yBvjKdCa7jKxJGFFdzlnTC5uX5qVJl8aIZs/hGHCjUKSY9AQB//bnkR/9aC85O32mQvi4z1BQqxGkn10Z8M2FPSAK8Y05tboAL4sjyPqsn9Gj+zT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770418718; c=relaxed/simple;
	bh=u8QQAqzb8UetpDNKxGwgyyEDXfWbz4Y/b8v1EYVqlr8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=X9SoNm2gMvS4RaeplLGkpeF9zWmuzAlFIuolcWGqloB01OAYrAsIXhBtQTb0je15fvnUbCdFgRAN7U86iyYQTDp41zuKYaD8OGvua5juOBK4W3A+wlsLf/J04niENGymtdHdeHduWjI0ELcROYjGtAIesnrpd7go8Ioe3TfSL6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aoT5+eL4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8194AC16AAE;
	Fri,  6 Feb 2026 22:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770418717;
	bh=u8QQAqzb8UetpDNKxGwgyyEDXfWbz4Y/b8v1EYVqlr8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=aoT5+eL4KZb1UAHf9Dc3mmjTg7xrwnqyZWcJ4ixY4+N5yabwx/rGXQuKOUHG3F7ZI
	 aIyVwYJaaMNWBNxu5VlMorvEnllKHJqtEtbUVRs1eQzeDuJBtuBlHgYXZO7jd9zjOc
	 i+xVhCMtOf/I70slU/vEbqRPUSCwl4noQyt9YEwswUyqInA4pmE1Cphvkgu6wKcsem
	 bDvfUzJlbtvbcHCfi9iygNbic9tJbKftLp3DZJNxq4qpb9/Ku4GB5wyoyRr7Dhx2xO
	 p2RaNy2OZMcxagkVhETDeoEdL0sa+FvozqfHqeqgJb8eFF9PvdR7yApTcy5cWpRjnz
	 i4GKYL21KA14g==
Date: Fri, 06 Feb 2026 16:58:36 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 David Lechner <dlechner@baylibre.com>, 
 Dixit Parmar <dixitparmar19@gmail.com>, linux-iio@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-leds@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Andy Shevchenko <andy@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20260206172845.145407-7-clamor95@gmail.com>
References: <20260206172845.145407-1-clamor95@gmail.com>
 <20260206172845.145407-7-clamor95@gmail.com>
Message-Id: <177041870854.250148.9552386816051601038.robh@kernel.org>
Subject: Re: [PATCH v2 06/11] dt-bindings: leds: leds-cpcap: convert to DT
 schema
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-6874-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,analog.com,gmail.com,baylibre.com,vger.kernel.org,atomide.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0471B103FAE
X-Rspamd-Action: no action


On Fri, 06 Feb 2026 19:28:40 +0200, Svyatoslav Ryhel wrote:
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

See https://patchwork.kernel.org/project/devicetree/patch/20260206172845.145407-7-clamor95@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


