Return-Path: <linux-leds+bounces-7543-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gO4WL/taxmm+JAUAu9opvQ
	(envelope-from <linux-leds+bounces-7543-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 27 Mar 2026 11:24:59 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAED3427C9
	for <lists+linux-leds@lfdr.de>; Fri, 27 Mar 2026 11:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1B70300A744
	for <lists+linux-leds@lfdr.de>; Fri, 27 Mar 2026 10:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0432F3ACF17;
	Fri, 27 Mar 2026 10:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="Rv8TV6f/"
X-Original-To: linux-leds@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF04E3AA51A;
	Fri, 27 Mar 2026 10:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606804; cv=none; b=ulNf1A4ydoTNWRn+Ivr5N2q4JoSLdB+kt898EdeKcfuymcL7WrG43aIB+ZJORtIT2rVHs72STz02ErdDOSXg650D5rd+xYV8tH0gXnTtKpScuAm+xv7wb0PbuL9RiTQZuEg7LDWzXMV1sjPR8jPqi2/QPBztU8nsEbMN0LnSLT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606804; c=relaxed/simple;
	bh=vIwmhW7GiLFB5zE29GmHbqoisru9dNovHZYfb00sEL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZfzSz16GWqLSoMLynzCtV6/jMbPFOEl9m3aTHBEthQXJH2tpZBpKfbmVr3LM+Ma7ul/p7o5qe42sv5MYcqOi7bHxw/r2ZD9gyHQxK+Gi/BQl1MuWjKnS/KdF8nTjRuxevN3PcrtTuI2eXDo2mr8JcURocr3D1tc2g6lrStJQYb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=Rv8TV6f/; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1774606801; bh=vIwmhW7GiLFB5zE29GmHbqoisru9dNovHZYfb00sEL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rv8TV6f/aVqGW9KVCj7jx9MMxyxww/lKvib6PI/MJD7IJWQFlWYM8UEB22r5Izupr
	 /fq6Om03C7nHsdgXA8iy9kmGsduTdlbAMiuBWUv47PfkjJze4R5yOa/4RsrOhMxJ6g
	 lp6JIrnSa+wQWODocwyNUY4rs2cmmMQN7IO9UBmhS70PBfRPvaHCDacBayksJpo1QH
	 tnM7bB+IgIaeDGXO/RfmxtYBplwsPg3Vb6mXPxv47begOlB1q1zbOaHnwk4gE+sxuL
	 ahsMCEwcJo7tn/sqC3B0Fn2uXF98sowFTT1ZXDI/f9fpXG4Kh0+uIxuPjnB6SPvHRr
	 rFJlvMCATqFIw==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id D091F1011B2; Fri, 27 Mar 2026 10:20:01 +0000 (GMT)
Date: Fri, 27 Mar 2026 10:20:01 +0000
From: Sean Young <sean@mess.org>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR
 transmitter
Message-ID: <acZZ0T1wzY0TCNTm@gofer.mess.org>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-5-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-5-446c6e865ad6@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mess.org,none];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7543-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@mess.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[mess.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gofer.mess.org:mid,0.0.0.1:email,mess.org:dkim,mess.org:email]
X-Rspamd-Queue-Id: 1EAED3427C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 06:07:28PM +0000, Biswapriyo Nath wrote:
> The IR transmitting LED is connected to SPI8 controller.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi   | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
> index f66ff5f7693..7d848117317 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
> @@ -99,6 +99,10 @@ key-volume-up {
>  	};
>  };
>  
> +&gpi_dma1 {
> +	status = "okay";
> +};
> +
>  &pm6125_gpios {
>  	vol_up_n: vol-up-n-state {
>  		pins = "gpio5";
> @@ -160,6 +164,10 @@ &qupv3_id_0 {
>  	status = "okay";
>  };
>  
> +&qupv3_id_1 {
> +	status = "okay";
> +};
> +
>  &rpm_requests {
>  	regulators-0 {
>  		compatible = "qcom,rpm-pm6125-regulators";
> @@ -332,6 +340,18 @@ &sdhc_2 {
>  	status = "okay";
>  };
>  
> +&spi8 {
> +	status = "okay";
> +
> +	irled@1 {
> +		compatible = "ir-spi-led";
> +		reg = <1>;
> +
> +		duty-cycle = /bits/ 8 <30>;
> +		spi-max-frequency = <1000000>;
> +	};
> +};
> +

Reviewed-by: Sean Young <sean@mess.org>

Thanks,

Sean

>  &tlmm {
>  	gpio-reserved-ranges = <0 4>, <30 4>;
>  };
> 
> -- 
> 2.53.0

