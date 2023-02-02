Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F18E687E5E
	for <lists+linux-leds@lfdr.de>; Thu,  2 Feb 2023 14:15:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231894AbjBBNPQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 2 Feb 2023 08:15:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231731AbjBBNPO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 2 Feb 2023 08:15:14 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FAA57921F
        for <linux-leds@vger.kernel.org>; Thu,  2 Feb 2023 05:15:12 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so3708801wma.1
        for <linux-leds@vger.kernel.org>; Thu, 02 Feb 2023 05:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ChcZMzAwS147NpOTEzCKxqucVxstoYum571fh0szJ54=;
        b=sMlcJhijCfFaD6XMnu6H7sw+PXhgRToleEpt4Lx4yydQ9zKs7K1uFkDCSY0gVLNFMK
         Mc1uIu1TwylPgI6SXhx93KHgj3x5vzbL/zJFv17BYsRJE/KhyNR3d2qkQJrJVeJSLvl3
         M57njZH7lhhyf0nhJ/NDhnwThfwKDdtzzVuBIBwt9uDqPZYrTtHV521X8y086HrBncNN
         32tI6BKVcGRyhrJnPxbQ3y2rCyZR0rHaK/g3N0PI4VBsJETo7IwoN/3rIyFmZpFxu539
         Ti3n/uA9qwtQk3NlHU32gZPhBSa9hLhP0Yz7+0IVD4OMI8EEgZzakAsnLpX1K+Md3vh/
         bugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ChcZMzAwS147NpOTEzCKxqucVxstoYum571fh0szJ54=;
        b=byD7J6gY/w26MLEWUNmKSJNn4hfCZw52P8SjdpIsUR70oJzIVqQVizhPoU9fP+CYZl
         QbCc+ew9JPlCzq5W0UJ5GeN7hXdxATAyRrta10MKtx0h7f3DWVNb5LBp+pnsbi2P/cRJ
         W1km2amd35xiBHjRW5gz90uuZKE/Wk114fFrGBkZM/BIp4amCSAuSegWcl6PJaV7hbUU
         MJtxfegx9B8QCLxUQIk/WEa64mqO08slHQ3JCCQp2tJNLk/nLsYaigKi4MFBBbE283Rq
         QSj6F7u4c7wGWvqZyvUi8bNnyqAEC8UKhnX+9cZingEAPLLWfulF7Qd5JONgl37JTVpF
         Fo6A==
X-Gm-Message-State: AO0yUKWIxuXsgCwoNW0b7lGeuvuZhbeU5mH6kGNPI2dk3+bK2OkAqy3H
        1VyL6GM93fW6ZFqcI3cmtZh7HA==
X-Google-Smtp-Source: AK7set8iqXMXD8qGr/Bum1AMCOvz0diCQJu0SkdhhMxbujHCSEJmKjoWEGTyuymLSaSBaOiv3Bpt9g==
X-Received: by 2002:a05:600c:44c8:b0:3dc:45a7:2b8a with SMTP id f8-20020a05600c44c800b003dc45a72b8amr5786890wmo.10.1675343710719;
        Thu, 02 Feb 2023 05:15:10 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j25-20020a05600c1c1900b003daf6e3bc2fsm7396721wms.1.2023.02.02.05.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 05:15:10 -0800 (PST)
Message-ID: <20eb5589-8287-90bd-3703-2818b61c6ba3@linaro.org>
Date:   Thu, 2 Feb 2023 14:15:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 1/2] dt-bindings: leds-lp55xx: add ti,charge-pump-mode
Content-Language: en-US
To:     Maarten Zanders <maarten.zanders@mind.be>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230202101032.26737-1-maarten.zanders@mind.be>
 <20230202101032.26737-2-maarten.zanders@mind.be>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202101032.26737-2-maarten.zanders@mind.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 02/02/2023 11:10, Maarten Zanders wrote:
> Add a binding to configure the internal charge pump for lp55xx.
> 
> Signed-off-by: Maarten Zanders <maarten.zanders@mind.be>



> diff --git a/include/dt-bindings/leds/leds-lp55xx.h b/include/dt-bindings/leds/leds-lp55xx.h
> new file mode 100644
> index 000000000000..8f59c1c12dee
> --- /dev/null
> +++ b/include/dt-bindings/leds/leds-lp55xx.h
> @@ -0,0 +1,10 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _DT_BINDINGS_LEDS_LP55XX_H
> +#define _DT_BINDINGS_LEDS_LP55XX_H
> +
> +#define LP55XX_CP_OFF		0
> +#define LP55XX_CP_BYPASS	1
> +#define LP55XX_CP_BOOST		2
> +#define LP55XX_CP_AUTO		3

Additionally, these are not used, so it's a dead binding. Drop. Sorry,
this is not the approach you should take.

Best regards,
Krzysztof

