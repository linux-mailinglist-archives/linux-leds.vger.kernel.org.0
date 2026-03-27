Return-Path: <linux-leds+bounces-7535-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qN9tFBA3xmm7HgUAu9opvQ
	(envelope-from <linux-leds+bounces-7535-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 27 Mar 2026 08:51:44 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4DC3409FD
	for <lists+linux-leds@lfdr.de>; Fri, 27 Mar 2026 08:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC17C3018D45
	for <lists+linux-leds@lfdr.de>; Fri, 27 Mar 2026 07:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08722ED866;
	Fri, 27 Mar 2026 07:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oW2oC0TD"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D76B3CAE8E;
	Fri, 27 Mar 2026 07:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774597882; cv=none; b=OGL/VRA5FIbe5wINpoByLvVs8TkENB3QhuEsr3xff1DbYdqW+3T1LjaNfet6WcpR2tww1UDOk4i/MYiv1DRDy5vg0Pd/lXcL8UGczsi4DpxajCdczIvUnjSHllmx6oLzOQuonViKxH1b9V6MCDJr9maToRWx8iosq7xIpVXXFQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774597882; c=relaxed/simple;
	bh=X4SHtt80dWhbPwyKQPEneW9QD0TqzHzy5YP5TuanMPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MGReWGIiezMQ/AK3V6n7M8nsrlzvMcy0PrdbLLhq21yD0F40Gr87ywf++3+RT4qgIKM30bLooClidKq6RWmIj/6hO3XWvojx5njKKEFAyQuF0fcvY9YY3+NwhHpDwyR3cUyokjUnn7HY1am5wdNglHFpBRqZBva+MRTJIY8bXCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oW2oC0TD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D946BC19423;
	Fri, 27 Mar 2026 07:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774597881;
	bh=X4SHtt80dWhbPwyKQPEneW9QD0TqzHzy5YP5TuanMPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oW2oC0TDPDcEJL40Ubhj2Tbs20NeQCGJCFEm6QphrVA7nG3987rI91+CyXQaJkWjI
	 q1YDdGZUrVU8Ss7owuckaEaU8WeoSfgaqpOEk0ihNUda6GLPaWDs6vcvFbTJw2eq3n
	 2V8SzXWqh3THU1w2+Ct2EB1HTWoBZAJq5L3e82Ve2DRRkz92upgY1xrGRo+9KheuOT
	 DERm/9iuANlmubGUPRHgs9kvLA+E6dESn/ahYN3SHpRiE31Ol7AV+4eOCE3GOFL/9m
	 MXve62Ot0WYTkJ1ST5dwremsOcPe16/WycNd4MW5ORO6AJAMivLNlD2C7gH+HXaFSy
	 tu+wCthasZbHA==
Date: Fri, 27 Mar 2026 08:51:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Martin Botka <martin.botka@somainline.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, linux-clk@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: leds: irled: ir-spi-led: Add new
 duty-cycle value
Message-ID: <20260327-natural-wild-mongrel-5bcc43@quoll>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-4-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-4-446c6e865ad6@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7535-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9B4DC3409FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 06:07:27PM +0000, Biswapriyo Nath wrote:
> 30 duty cycle for IR transmitter is used in Xiaomi Redmi Note 8 (ginkgo).
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml b/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
> index 72cadebf6e3..0297bfbb275 100644
> --- a/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
> +++ b/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
> @@ -25,7 +25,7 @@ properties:
>  
>    duty-cycle:
>      $ref: /schemas/types.yaml#/definitions/uint8
> -    enum: [50, 60, 70, 75, 80, 90]
> +    enum: [30, 50, 60, 70, 75, 80, 90]

Hm, why is this enum, instead of 1-99, in the first place?

Best regards,
Krzysztof


