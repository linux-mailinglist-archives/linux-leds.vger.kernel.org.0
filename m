Return-Path: <linux-leds+bounces-8073-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kH3kA7mDAGoLJwEAu9opvQ
	(envelope-from <linux-leds+bounces-8073-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 15:10:17 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4656750445F
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 15:10:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0E045304A4D1
	for <lists+linux-leds@lfdr.de>; Sun, 10 May 2026 12:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD07389455;
	Sun, 10 May 2026 12:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pVm7IEAe"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586B138911B;
	Sun, 10 May 2026 12:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778417048; cv=none; b=ClSZKC/S+U+ISb1K9con6TaaTPQaKqASalPouQS7YnWdQpx+jmocxcLgd/zZn5kRFCJOWL6EUSEvbHgPgtX9JxTvWUuSWOYEn6YnMfkzB4G1xwOxp5OUYTleyKldGQuIaU6g2jgjYSklNmyNRYkfSMvY3xh9RRA6we0mP1dLkXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778417048; c=relaxed/simple;
	bh=UXZunLOTwritnG0Uroa7+WRHucRVxpgDVVzKmx6QNkA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=OO4mwdnpEwchPaT86KPmGaPah0O5at2bny/eXi05w3LEskZ2alpr8i4TUQTR42TL8XW7hwoAtDDsGx914aIcVXNngoWAYqu98UQxsT6BComPfZAIkgH4SMx9cPQY9xNyGjVog5kNDmokIgdjxyHdlUx92tJkjtE8HIIsPCyDNm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pVm7IEAe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2087C2BCC9;
	Sun, 10 May 2026 12:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778417047;
	bh=UXZunLOTwritnG0Uroa7+WRHucRVxpgDVVzKmx6QNkA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=pVm7IEAeN+m8awpt5JYnu1BkGHYi0ZLyx2/P2bHsz7ZitHMvX/BdY+C7aIlWOrRYH
	 e/G5J58BCpGDiCwXZjNj4isTyKaYs2oK9rEKBcBZrxCYqNU4WlFtCQwz4eD5bXim+i
	 istYimUJbvsT3otA2F3XGb9D5QQV0+6JxndaarTrCPMpEYW0IGZGbxfoeHDchPS3U1
	 /draodfYYxnADGiKERmGoN7RhyLihq8HLi2nsl4aBDluxeM1fioxYJ8xLqq2LnNXQ8
	 Knbti7nYmWvoERFkWsAtZ7fEpYNa89A+bCxaJOlii2kzSU6hE2DfhM5xAavpX/P8a3
	 r9QP/zahBipAw==
Date: Sun, 10 May 2026 07:44:05 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Lee Jones <lee@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 David Lechner <dlechner@baylibre.com>, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-input@vger.kernel.org
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20260510110804.33045-2-clamor95@gmail.com>
References: <20260510110804.33045-1-clamor95@gmail.com>
 <20260510110804.33045-2-clamor95@gmail.com>
Message-Id: <177841704471.2552402.10905662666589462480.robh@kernel.org>
Subject: Re: [PATCH v5 1/6] dt-bindings: leds: leds-cpcap: convert to DT
 schema
X-Rspamd-Queue-Id: 4656750445F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,atomide.com,gmail.com,baylibre.com];
	TAGGED_FROM(0.00)[bounces-8073-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


On Sun, 10 May 2026 14:07:59 +0300, Svyatoslav Ryhel wrote:
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

See https://patchwork.kernel.org/project/devicetree/patch/20260510110804.33045-2-clamor95@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


