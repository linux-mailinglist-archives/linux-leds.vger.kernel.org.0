Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77787DB1FE
	for <lists+linux-leds@lfdr.de>; Thu, 17 Oct 2019 18:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403905AbfJQQLC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Oct 2019 12:11:02 -0400
Received: from muru.com ([72.249.23.125]:37786 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728557AbfJQQLC (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Oct 2019 12:11:02 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5388D804F;
        Thu, 17 Oct 2019 16:11:34 +0000 (UTC)
Date:   Thu, 17 Oct 2019 09:10:57 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>
Subject: Re: [PATCH v13 09/18] ARM: dts: n900: Add reg property to the LP5523
 channel node
Message-ID: <20191017161057.GM5610@atomide.com>
References: <20191016155954.29044-1-dmurphy@ti.com>
 <20191016155954.29044-10-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191016155954.29044-10-dmurphy@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

* Dan Murphy <dmurphy@ti.com> [191016 16:01]:
> Add the reg property to each channel node.  This update is
> to accomodate the multicolor framework.  In addition to the
> accomodation this allows the LEDs to be placed on any channel
> and allow designs to skip channels as opposed to requiring
> sequential order.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> CC: Tony Lindgren <tony@atomide.com>
> CC: "Benoît Cousson" <bcousson@baylibre.com>
> 
> k# interactive rebase in progress; onto ae89cc6d4a8c

Maybe check what's up with the line above :)

Othwerwise looks good to me, best to merge this together
with the rest of the series when ready:

Acked-by: Tony Lindgren <tony@atomide.com>

> ---
>  arch/arm/boot/dts/omap3-n900.dts | 29 ++++++++++++++++++++---------
>  1 file changed, 20 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
> index 84a5ade1e865..643f35619246 100644
> --- a/arch/arm/boot/dts/omap3-n900.dts
> +++ b/arch/arm/boot/dts/omap3-n900.dts
> @@ -607,63 +607,74 @@
>  	};
>  
>  	lp5523: lp5523@32 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
>  		compatible = "national,lp5523";
>  		reg = <0x32>;
>  		clock-mode = /bits/ 8 <0>; /* LP55XX_CLOCK_AUTO */
>  		enable-gpio = <&gpio2 9 GPIO_ACTIVE_HIGH>; /* 41 */
>  
> -		chan0 {
> +		chan@0 {
>  			chan-name = "lp5523:kb1";
>  			led-cur = /bits/ 8 <50>;
>  			max-cur = /bits/ 8 <100>;
> +			reg = <0>;
>  		};
>  
> -		chan1 {
> +		chan@1 {
>  			chan-name = "lp5523:kb2";
>  			led-cur = /bits/ 8 <50>;
>  			max-cur = /bits/ 8 <100>;
> +			reg = <1>;
>  		};
>  
> -		chan2 {
> +		chan@2 {
>  			chan-name = "lp5523:kb3";
>  			led-cur = /bits/ 8 <50>;
>  			max-cur = /bits/ 8 <100>;
> +			reg = <2>;
>  		};
>  
> -		chan3 {
> +		chan@3 {
>  			chan-name = "lp5523:kb4";
>  			led-cur = /bits/ 8 <50>;
>  			max-cur = /bits/ 8 <100>;
> +			reg = <3>;
>  		};
>  
> -		chan4 {
> +		chan@4 {
>  			chan-name = "lp5523:b";
>  			led-cur = /bits/ 8 <50>;
>  			max-cur = /bits/ 8 <100>;
> +			reg = <4>;
>  		};
>  
> -		chan5 {
> +		chan@5 {
>  			chan-name = "lp5523:g";
>  			led-cur = /bits/ 8 <50>;
>  			max-cur = /bits/ 8 <100>;
> +			reg = <5>;
>  		};
>  
> -		chan6 {
> +		chan@6 {
>  			chan-name = "lp5523:r";
>  			led-cur = /bits/ 8 <50>;
>  			max-cur = /bits/ 8 <100>;
> +			reg = <6>;
>  		};
>  
> -		chan7 {
> +		chan@7 {
>  			chan-name = "lp5523:kb5";
>  			led-cur = /bits/ 8 <50>;
>  			max-cur = /bits/ 8 <100>;
> +			reg = <7>;
>  		};
>  
> -		chan8 {
> +		chan@8 {
>  			chan-name = "lp5523:kb6";
>  			led-cur = /bits/ 8 <50>;
>  			max-cur = /bits/ 8 <100>;
> +			reg = <8>;
>  		};
>  	};
>  
> -- 
> 2.22.0.214.g8dca754b1e
> 
