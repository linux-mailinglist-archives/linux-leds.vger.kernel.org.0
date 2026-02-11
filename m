Return-Path: <linux-leds+bounces-6932-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMebF3bzjGmqvwAAu9opvQ
	(envelope-from <linux-leds+bounces-6932-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 11 Feb 2026 22:24:06 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D98B9127BEB
	for <lists+linux-leds@lfdr.de>; Wed, 11 Feb 2026 22:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C296C3148BF6
	for <lists+linux-leds@lfdr.de>; Wed, 11 Feb 2026 21:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F12361DAB;
	Wed, 11 Feb 2026 21:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqgwT0N2"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F71E36997D;
	Wed, 11 Feb 2026 21:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770844818; cv=none; b=J64xYHjf/8HgS5y+JZUnlsEb37T/UqGOY1lZdmZ02UD8wBQPbwROgWvfPxc4VQqnFp0EU7iAMnb4CcHL3MVVO9NrKdGE+3Wrc8JNqqCFDijgR0+2eluN9Vwl27bGmnC/MtznHQtw5qhmJPRuZYhKwa9ZWTN78rYqp/TCbbO9dc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770844818; c=relaxed/simple;
	bh=NmSfBSUhLvhlKBoBPsKCiDZNcwDXHuph2odVwc8Biok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HWbPoQ2WGExZmRaq/BJiGI+SgrW4lfOnOb2YlZT/3G83QHGEha4dd0y9K21W8AdYe/3UYdM8skTk2YGdc2E7IaM7xtJ5oGllpk4EAhTz9nWOshOvtizjtVQFe0Pfaq4XIzuhRCo64wdIGCSccetSKHZbvJNxIUMn/bq6JBTnmTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqgwT0N2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47DFC19423;
	Wed, 11 Feb 2026 21:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770844817;
	bh=NmSfBSUhLvhlKBoBPsKCiDZNcwDXHuph2odVwc8Biok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TqgwT0N2fH3GVvHeh7RPFL6FVUd3Ps8wQPQljcvR0cfk2I6GrB6TsSJxp66dVjJMW
	 11bBwTZ+QLTanHow1J1a5xPcrkLROM21cLTcVWjubSUJnbNP1r/BfYg8j6r/GBKxBE
	 0ZjYPmhrh82oefNLFyEjqJlc5vIZ1B0zA7V8+pFbjBccDBfdY5ilFpP9Ox4iMcnk/z
	 52BRXmjUI2GkcDEGE4b/HS5v1d5CYHYFN6DFauKZUHWMneayJd4Bf4/G/1PmzFfFG8
	 Fkjoje2FfDxiX38mu6SK7JQo+9hl7R3w9EZQmOyqaEAMkXftnWU3BV2aCBGmHpfvEy
	 QkUBJn0gH0dhg==
Date: Wed, 11 Feb 2026 15:20:16 -0600
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Tony Lindgren <tony@atomide.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 08/11] dt-bindings: mfd: motorola-cpcap: convert to DT
 schema
Message-ID: <20260211212016.GA3910589-robh@kernel.org>
References: <20260206172845.145407-1-clamor95@gmail.com>
 <20260206172845.145407-9-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206172845.145407-9-clamor95@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6932-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,atomide.com,vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: D98B9127BEB
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 07:28:42PM +0200, Svyatoslav Ryhel wrote:
> Convert devicetree bindings for the Motorola CPCAP MFD from TXT to YAML.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/mfd/motorola,cpcap.yaml          | 411 ++++++++++++++++++
>  .../bindings/mfd/motorola-cpcap.txt           |  78 ----
>  2 files changed, 411 insertions(+), 78 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
> new file mode 100644
> index 000000000000..7e350721d9f6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
> @@ -0,0 +1,411 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/motorola,cpcap.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Motorola CPCAP PMIC MFD
> +
> +maintainers:
> +  - Svyatoslav Ryhel <clamor95@gmail.com>
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - motorola,cpcap
> +      - st,6556002

This does not match the only user in the kernel .dts files as 
"st,6556002" should be a fallback.

Rob

