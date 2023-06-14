Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8E7E730086
	for <lists+linux-leds@lfdr.de>; Wed, 14 Jun 2023 15:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245165AbjFNNtg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 14 Jun 2023 09:49:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245200AbjFNNtR (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 14 Jun 2023 09:49:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D99762682;
        Wed, 14 Jun 2023 06:49:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 62D8E63F20;
        Wed, 14 Jun 2023 13:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83FBDC433C8;
        Wed, 14 Jun 2023 13:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686750555;
        bh=K8wYi/yoT8s5R17p76hSh/ZFx53ah7YMr+dtJL5G/tY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M6Wqw5L7F/ncfbdX1K+o3SbPkqW1ek6AgMM1Ytm8D3IPkaskthW9jMz3WmIERLjzx
         Wm7Waze4XDGkMBUU/Y5nQZhhTM4BZmy6F20S6x+60wVxUpWXJOMd/D5ESCatMsUbeg
         mcmrUb1Mlu8PY5Xi0T5HL7Ve3s+E+WWTOuQdNYcDG4bJYUH5zWV0yyQ0vDaAm+G79M
         6rmhzR3FHZXp3eM6ph22wmR2UyyAKaymh1fmWcWqUlmAeQEJLbZKiT3kMap5Jct2fY
         ZOqY5+OXaWS7JPdYD4OgX3Rkz7mHlhPMMir1CF3fM9vghCiduD5ISHQyg239U++BF/
         XY8IZbYJ94t6A==
Date:   Wed, 14 Jun 2023 14:49:09 +0100
From:   Lee Jones <lee@kernel.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Christian Marangi <ansuelsmth@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 net-next resend] leds: trigger: netdev: uninitialized
 variable in netdev_trig_activate()
Message-ID: <20230614134909.GT3635807@google.com>
References: <ZIlmX/ClDXwxQncL@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZIlmX/ClDXwxQncL@kadam>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 14 Jun 2023, Dan Carpenter wrote:

> The qca8k_cled_hw_control_get() function which implements ->hw_control_get
> sets the appropriate bits but does not clear them.  This leads to an
> uninitialized variable bug.  Fix this by setting mode to zero at the
> start.
> 
> Fixes: e0256648c831 ("net: dsa: qca8k: implement hw_control ops")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
> Resending because this actually goes through net-next and not the led
> subsystem.
> 
> v2: In the original patch I fixed qca8k_cled_hw_control_get() instead
> so that patch went to netdev instead of to the led subsystem.
> https://lore.kernel.org/all/5dff3719-f827-45b6-a0d3-a00efed1099b@moroto.mountain/
> Fixing it here is a more reliable way to do it.
> 
>  drivers/leds/trigger/ledtrig-netdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]
