Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C43707A286B
	for <lists+linux-leds@lfdr.de>; Fri, 15 Sep 2023 22:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237316AbjIOUqo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 15 Sep 2023 16:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237532AbjIOUqW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 15 Sep 2023 16:46:22 -0400
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAD5A2711
        for <linux-leds@vger.kernel.org>; Fri, 15 Sep 2023 13:46:14 -0700 (PDT)
Received: from eig-obgw-5006a.ext.cloudfilter.net ([10.0.29.179])
        by cmsmtp with ESMTP
        id h8dcqKF8IEoVshFheqHx8P; Fri, 15 Sep 2023 20:46:14 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with ESMTPS
        id hFhdqTf51yBEYhFhdqk09v; Fri, 15 Sep 2023 20:46:14 +0000
X-Authority-Analysis: v=2.4 cv=durItns4 c=1 sm=1 tr=0 ts=6504c296
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=HvF037n1xESchLcPDVoA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=LkG8D8jTw8pUKt1gT83+1j6DzXIAZ3iWRsRfmknyF7U=; b=a0SKl1x5wk5rkSLI0hQABwndC9
        tffQ1zHbUshzGDlqIznEe4MbIxKn3Od5JeSCGKez4ffxcpIIAmO6FmdFlABNx04mZea7yAONebfgI
        6dnhy9V7SjZzDtduk9+zVEyMAXVaLY6xrx3NmqLCkdv2HMaOxvqw0LXAus8NMpqwLZHazkt6MiaRJ
        myKD+YwyuDGP9+5tI6lp5PXi/zsbVW7FcDEC95V4OUnyFPFIWMs3cHE8LyI6NlBgUZeDycd5aOETI
        FFLsnXV6vSc4fiIPbhheqRAib3saB54DkSY3HuwnwEH5SNvqOifg4dthZsrbu/ZmVGD2RyvWxEzbX
        HmVqkWzQ==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:53288 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.96)
        (envelope-from <gustavo@embeddedor.com>)
        id 1qhFhc-002aaD-1W;
        Fri, 15 Sep 2023 15:46:12 -0500
Message-ID: <e6c4f5c4-c33a-0196-0edb-e9002bfc1596@embeddedor.com>
Date:   Fri, 15 Sep 2023 14:47:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] leds: gpio: Annotate struct gpio_leds_priv with
 __counted_by
Content-Language: en-US
To:     Kees Cook <keescook@chromium.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
References: <20230915201003.never.148-kees@kernel.org>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230915201003.never.148-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qhFhc-002aaD-1W
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8]) [187.162.21.192]:53288
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 219
X-Org:  HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfCliKOdQ+ql/4rtXlQBTrJTa0V2Wqxc/YrLT87uooQD2roQ0tJfrRhfOvu1vp6imHZOz+sYdqXDj0hUinhHQnYNyU/wvKjqGtSix3PZyccZvqG+RLQ+K
 Q4Qd836kt8NTH3Pl/yzdS3JU3B+SDibIOU6lLcP1uID5U2Kzz25Ue1hkXdjmA71eGJuAzSaqCsDDPCw3LNwWjyVGSmj7Pvoc3fRl6rsAMHFkUqP74lYJyCsR
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org



On 9/15/23 14:10, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct gpio_leds_priv.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Lee Jones <lee@kernel.org>
> Cc: linux-leds@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
-- 
Gustavo

> ---
>   drivers/leds/leds-gpio.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
> index 7bfe40a6bfdd..a6597f0f3eb4 100644
> --- a/drivers/leds/leds-gpio.c
> +++ b/drivers/leds/leds-gpio.c
> @@ -142,7 +142,7 @@ static int create_gpio_led(const struct gpio_led *template,
>   
>   struct gpio_leds_priv {
>   	int num_leds;
> -	struct gpio_led_data leds[];
> +	struct gpio_led_data leds[] __counted_by(num_leds);
>   };
>   
>   static struct gpio_leds_priv *gpio_leds_create(struct platform_device *pdev)
