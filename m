Return-Path: <linux-leds+bounces-25-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC7E7EF2A7
	for <lists+linux-leds@lfdr.de>; Fri, 17 Nov 2023 13:33:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4810128127F
	for <lists+linux-leds@lfdr.de>; Fri, 17 Nov 2023 12:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C3517999;
	Fri, 17 Nov 2023 12:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q8/AkM6q"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B580130FAB;
	Fri, 17 Nov 2023 12:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD36C433C8;
	Fri, 17 Nov 2023 12:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700224386;
	bh=6GwD/+0RW2AAON4W/qJdWK7zK0D+kuihmnQOP4ByGns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q8/AkM6qMsYZXczTXA7cHWvewZuvlhCf7ZVVeo5iIVmwEZrVSyLiGZZJG5PFlIfYS
	 adUik5JSfkw38cS68Ei5jwSAKcMIXgU6HTEe/kTg+RVSUKl0awhTx6+WDooxzfZzyk
	 424/QbYjoMaoLyOc17nb3t2UD0sRpNCVrDWl9fVdkC5ijyALU9eHK36KrP8mvm/OVU
	 vQDxefo/ZyS/AMjRUeIWVxgemBcQhL6iT2txRHYymjrfhcScw69JFVqUN8H4HBEn1x
	 3lrtRc+JPxWI2XkV0UDJ4XY2uZlW8Ykt2+qstKv00MyDsKbJp2rIs8W3RwjU0SzZ5T
	 /D4yh+oSa3FCg==
Date: Fri, 17 Nov 2023 12:32:59 +0000
From: Lee Jones <lee@kernel.org>
To: Shiji Yang <yangshiji66@outlook.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: leds: add 'internet' and 'signal'
 function definitions
Message-ID: <20231117123259.GA153049@google.com>
References: <TYAP286MB0315AE8F62E6AB48E3F9A0DDBCA5A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYAP286MB0315AE8F62E6AB48E3F9A0DDBCA5A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>

[Intentional top-post]

Andrew, Florian,

Does this fall into your area of expertise?

On Fri, 03 Nov 2023, Shiji Yang wrote:

> These two types of LEDs are widely used in routers and NICs.
> 
> The 'signal' LED is used to display the wireless signal strength.
> Usually, there are 3~4 LEDs in one group to indicate the signal
> strength, similar to the signal icon on a mobile phone.
> 
> The 'internet' LED can indicate whether the device can access a
> specific server. It's different from 'wan'. 'wan' usually indicates
> whether the WAN port is connected to the modem (internet services
> may still be unavailable). But the 'internet' shows if the device
> can successfully ping servers such as 8.8.8.8 to detect the internet
> connection status. When the router is running in AP only mode, we
> can even connect LAN port to the AC/modem to connect to the internet.
> In this case, the 'internet' LED should be on. On some routers, both
> 'internet' and 'wan' are available and can be controlled separately.
> 
> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
> ---
> 
> Changes in v2:
> * Remove the LED name sorting patch as it changes the ABI.
> * Add "devicetree@vger.kernel.org" to '--to' list.
>   Thanks to Rob Herring and Krzysztof Kozlowski for letting me know I
>   can send patch to multiple mailing list at once.
> 
> Changes in v3:
> * Add more information about the new added LEDs.
> * Remove the missing LED fix as Jisheng Zhang has already sent a
>   similar one. I should search the mailing list first...
> 
> v1:
> https://lore.kernel.org/all/TYAP286MB0315FE921FF113BF76F7B700BCA0A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM/
> 
> v2:
> https://lore.kernel.org/all/TYAP286MB03159A83A77E6FD59F271D9BBCA0A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM/
> 
>  include/dt-bindings/leds/common.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
> index 9a0d33d02..55a426e39 100644
> --- a/include/dt-bindings/leds/common.h
> +++ b/include/dt-bindings/leds/common.h
> @@ -88,11 +88,13 @@
>  #define LED_FUNCTION_FLASH "flash"
>  #define LED_FUNCTION_HEARTBEAT "heartbeat"
>  #define LED_FUNCTION_INDICATOR "indicator"
> +#define LED_FUNCTION_INTERNET "internet"
>  #define LED_FUNCTION_LAN "lan"
>  #define LED_FUNCTION_MAIL "mail"
>  #define LED_FUNCTION_MTD "mtd"
>  #define LED_FUNCTION_PANIC "panic"
>  #define LED_FUNCTION_PROGRAMMING "programming"
> +#define LED_FUNCTION_RSSI "rssi"
>  #define LED_FUNCTION_RX "rx"
>  #define LED_FUNCTION_SD "sd"
>  #define LED_FUNCTION_STANDBY "standby"
> -- 
> 2.39.2
> 

-- 
Lee Jones [李琼斯]

