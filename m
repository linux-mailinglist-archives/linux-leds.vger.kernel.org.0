Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3FC5748D96
	for <lists+linux-leds@lfdr.de>; Wed,  5 Jul 2023 21:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233314AbjGETPC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 5 Jul 2023 15:15:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234821AbjGETOH (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 5 Jul 2023 15:14:07 -0400
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14A6D1FF7;
        Wed,  5 Jul 2023 12:08:29 -0700 (PDT)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-77a62a84855so277327039f.1;
        Wed, 05 Jul 2023 12:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688584059; x=1691176059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXTVp5bLlN8Dye4PyREmx7eR8SYfjHTbX/OgX4GbQ4c=;
        b=jAPPAV8LVJlpBLpGgGGV9YeBfWCGjGYrclLVlk7tS16mYcxCK/30Xnt2+ahhs53GdU
         XaO+9tKlskdyE1kzUX1yIfAtQgw32kXHKj1puIb7MAVh8Bq0m6Kk97wqLGNjXCLl/wqb
         kjNRGTCSVnDRP1e7+UhkPj4iXX0LarT+PzVSQwfPidX+bjpGnJAL1QYwSKz80DYkAjw0
         b0OWAOAb0YkNElg20BH9bhLbjD1jfwnmOUP3lt5ASZb9Y/wSPpVsL15Y1IzCmcE6s/Qf
         z9yh6R3h9tLrCph2WqD+xDJjTuiXK/ZpK4Bwi9CyiWj3nh4Q35OgXBeaZj8WvFDoZb9T
         339Q==
X-Gm-Message-State: ABy/qLaDILeYiYatk6EVChtcMBTK9exmXmbgVsS/Lic0CHv8KMptZJZx
        paDBmrN/rt4Y29Puan8EGA==
X-Google-Smtp-Source: APBJJlEw3s95+yreVL8/zH9bFXCIUVKhAUrPu/w7gjrTe/wT1EGB08eVJFGuMTJE/XI+hPeN49vf3w==
X-Received: by 2002:a05:6602:276e:b0:777:afce:a35f with SMTP id l14-20020a056602276e00b00777afcea35fmr93287ioe.0.1688584058858;
        Wed, 05 Jul 2023 12:07:38 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id j5-20020a02cc65000000b0042b298507b3sm3303587jaq.42.2023.07.05.12.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 12:07:38 -0700 (PDT)
Received: (nullmailer pid 1616446 invoked by uid 1000);
        Wed, 05 Jul 2023 19:07:36 -0000
Date:   Wed, 5 Jul 2023 13:07:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        linux-leds@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] [RFC] dt-bindings: leds: bd2606mvv: Fix maximum register
 value
Message-ID: <168858405563.1616231.4206225998783878334.robh@kernel.org>
References: <20230704202929.91962-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704202929.91962-1-marex@denx.de>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


On Tue, 04 Jul 2023 22:29:29 +0200, Marek Vasut wrote:
> Since the chip can drive up to 6 lines, the maximum
> register number should be only 5, not 6.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andreas Kemnade <andreas@kemnade.info>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-leds@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/leds/rohm,bd2606mvv.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

