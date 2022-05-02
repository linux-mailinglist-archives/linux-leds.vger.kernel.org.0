Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6440951712E
	for <lists+linux-leds@lfdr.de>; Mon,  2 May 2022 16:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381002AbiEBOID (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 2 May 2022 10:08:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236925AbiEBOIC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 2 May 2022 10:08:02 -0400
Received: from mail.schwermer.no (mail.schwermer.no [49.12.228.226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C21C63898;
        Mon,  2 May 2022 07:04:31 -0700 (PDT)
X-Virus-Scanned: Yes
Message-ID: <cbb3434b-a149-ccd7-d620-c18fb1845e2f@svenschwermer.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=svenschwermer.de;
        s=mail; t=1651500267;
        bh=aVAwVgTGrGTC+oj/6rhsD1aJW6PcX3Onk4UMqeNllRY=;
        h=Subject:From:To:Cc:References:In-Reply-To;
        b=L2lQRVOeyrlBxyS2ATEJbG1pkW55O2PR/BL/E7Q7RCVjO47TvqQYD69bf5cdts+jZ
         X0zGzkMbpn7EQkXLdaXlpGYhlVCuDxVgTWa+/apBu5+KfXejaciQ68McoNgm2MI/aS
         crYa1lqq6pGTmwBIvWegKHaEVTxwjyOCeWwV8e9WD1nSRnn4vBLDgwnlFsanFEQuAq
         phmhW3TeiX68mCI5GR01G0AHzc1s3LfcE8zaxpUFhIDplrT/pwuZvQeK64V0NSIjgd
         y7IOhwL1yWC2z42kHkfDJWazjBtACfPU0fzqDvxQjuiRS5vG4zhYGKl2gTyFuLLDoE
         SifkDCcMAWuXA==
Date:   Mon, 2 May 2022 16:04:26 +0200
Mime-Version: 1.0
Subject: Re: [PATCH v8 0/3 RESEND] Multicolor PWM LED support
Content-Language: en-US
From:   Sven Schwermer <sven@svenschwermer.de>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     pavel@ucw.cz, robh+dt@kernel.org, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
        post@lespocky.de, andy.shevchenko@gmail.com, robh@kernel.org
References: <20220407073225.71605-1-sven@svenschwermer.de>
In-Reply-To: <20220407073225.71605-1-sven@svenschwermer.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

Is there anything else I can do to get this series merged soon?

Best regards,
Sven

On 4/7/22 09:32, sven@svenschwermer.de wrote:
> From: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
> 
> Hi,
> 
> I believe this patch series is ready for merging.
> 
> Pavel, please let me know if you need more to get this merged.
> 
> Best regards,
> Sven
> 
> Sven Schwermer (3):
>    dt-bindings: leds: Optional multi-led unit address
>    dt-bindings: leds: Add multicolor PWM LED bindings
>    leds: Add PWM multicolor driver
> 
>   .../bindings/leds/leds-class-multicolor.yaml  |   2 +-
>   .../bindings/leds/leds-pwm-multicolor.yaml    |  79 ++++++++
>   drivers/leds/Kconfig                          |  11 ++
>   drivers/leds/Makefile                         |   1 +
>   drivers/leds/leds-pwm-multicolor.c            | 186 ++++++++++++++++++
>   5 files changed, 278 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm-multicolor.yaml
>   create mode 100644 drivers/leds/leds-pwm-multicolor.c
> 
