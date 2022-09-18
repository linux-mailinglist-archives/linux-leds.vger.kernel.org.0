Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14E775BBE93
	for <lists+linux-leds@lfdr.de>; Sun, 18 Sep 2022 17:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiIRPG4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 18 Sep 2022 11:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbiIRPGz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 18 Sep 2022 11:06:55 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAF0720F65
        for <linux-leds@vger.kernel.org>; Sun, 18 Sep 2022 08:06:54 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id l12so31095062ljg.9
        for <linux-leds@vger.kernel.org>; Sun, 18 Sep 2022 08:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=0oIPD63quUL9d80Gfs3KT8Dn2nvU0UomueQqpHSDHL8=;
        b=DYlaUrGNUZh+IfykxFztAYIvBCMGpmIkIBG9YvJzsFcQvxQOCaTkM4HovpJRUITm6v
         WqXcpGxAslrSDLfQKkW4DfGlS2i8UmuBINzwqCkQMe7JNn/KWmoyhBGfVU70O3SCN0qb
         ObWoVysfSfmUmTOFuolJh48bVfy6rXvNqMbxyoxUgcSMSCJ8sGiPTCsyLGCO61c2QVVt
         HD+h3+SSuwMLNFIpt1xA/HawtiytrnKb2LV37DFbOv8x/Vm8YUOR0Ds20CzABDvQND9P
         nNBLBb8vJHqhrWkZ4tczyrrwKjA52s63oKvwbFXALkb5F4kcxdi/jJlYAvwCxAvkzGaT
         n4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=0oIPD63quUL9d80Gfs3KT8Dn2nvU0UomueQqpHSDHL8=;
        b=eB73IofkUZaPc+NPzWlsk1ei/K1cKN7EdqWuJXU7ho7H716bwdeGzNFYSFNOk+/pZk
         770D/YU8B5sPEei1/15kTW6eWofcwS7blkpi2wGBYa7jI2LceuSNOB3/BsSqUb1qldGf
         X99QO+u0v1hJcRokw7yDTuN+qLlLQGfNAiIcL43WKQ9azLXaHsxLPmt5YJ6nXqmgBCms
         KrFKc1V2qyRyaDzVPsjtc6pu/GC7JG0nr6xYTdlyhzbtjaXaVafrfRd1D0p3Mb5/i1Wa
         0GJn1p3A1kQXy1ty8t/7oDzgjZ+1S5+AgAeCfLFdn/imv1cOYwwtG9LN0jp9VWpgWdky
         W6mw==
X-Gm-Message-State: ACrzQf36eacVawNK+VkBlmOuLnHWQ7Ggjpr1WqcP4kxOVdCWeEWuWDjz
        Xld/mO8OrwU+0dA6jnfcjvxgjOQbR1I=
X-Google-Smtp-Source: AMsMyM6f9JgvYM7TLkneDFyja4i6TCAGhstQDwvGcIlzYv45/IPUgneJXtPN/qPzPjXqqqSc/M6HVg==
X-Received: by 2002:a2e:a584:0:b0:26c:2903:715b with SMTP id m4-20020a2ea584000000b0026c2903715bmr4064619ljp.452.1663513613216;
        Sun, 18 Sep 2022 08:06:53 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 3-20020ac24823000000b00498ebd60c35sm4710876lft.165.2022.09.18.08.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Sep 2022 08:06:52 -0700 (PDT)
Message-ID: <a86e1abd-e464-f8de-8391-af0ef0dc7108@gmail.com>
Date:   Sun, 18 Sep 2022 17:06:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: Clarification questions regarding multicolor leds
Content-Language: en-US
To:     Werner Sembach <wse@tuxedocomputers.com>,
        linux-leds@vger.kernel.org
References: <30cbbf20-08cf-a69b-4f58-359a9802e86f@tuxedocomputers.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <30cbbf20-08cf-a69b-4f58-359a9802e86f@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Werner,

On 8/19/22 09:45, Werner Sembach wrote:
[...]
> Forth question: What is actual the purpose of mc_subled.brightness and 
> mc_subled.channel?

brightness is for storing subled brightness calculated in
led_mc_calc_color_components() and channel is for storing
information about actual iout that is related to the given
sub-LED. It was introduced for the cases like lp55xx driver
family (see e.g. drivers/leds/leds-lp55xx-common.c).

-- 
Best regards,
Jacek Anaszewski
