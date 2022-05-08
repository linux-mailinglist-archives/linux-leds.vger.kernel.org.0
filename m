Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A63751F0E7
	for <lists+linux-leds@lfdr.de>; Sun,  8 May 2022 21:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbiEHT7Z (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 8 May 2022 15:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230500AbiEHT7X (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 8 May 2022 15:59:23 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E3612C
        for <linux-leds@vger.kernel.org>; Sun,  8 May 2022 12:55:32 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id i10so20583030lfg.13
        for <linux-leds@vger.kernel.org>; Sun, 08 May 2022 12:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DcnnTahHkqBl+zFxqve8WeyCmeGZC3frHcthHfdX98A=;
        b=dSwXHqJRyTlgpwD+3jvhLtnoyU8AyCf905Cbq1TMFGzW9uR7DDGV7ndZef9ZCX7oGw
         cx/oG2KZO6jmbrRd+Qn+2rzLBGBdVsnZgGmIMMpxam1uYsewBIO+aG2Rdmwgy8GQEz7K
         tCVQNU2cEhHPrMHep0zx+/cf2FPXfi8Iwbuw6j4oCShDnGf0pZnyl3oH6jidfpgvu2+G
         CAFa3YdqR3WFMx6WVSBet5bwKEkUnGUt43OaN0ZRTZArqxuOiaBxDfEPV3NHf5ZBiBj+
         du4PZRxRc2IliJrYO2xdjbaSqZlJ+JT1KwWohFeOOCbq0qLwIH1Om8GufWrOg0oSgAYi
         sKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DcnnTahHkqBl+zFxqve8WeyCmeGZC3frHcthHfdX98A=;
        b=pPobzZnzXlGdzk1soYkXY9Hz9nZzKRDobcWu3evtx8FqyPSY6UuS0ZkryJ6B3MqbD9
         gMFaMuGxF/S0ArheRgLyfiYbOP+1Na+Sry9la7grPUHF/51uu7EXPof4qkO5Ay8EyGYD
         yhkWR6MJ6vhROQRDsItJnl1mJ+Kks55SITKS3m806i+0mVBvUlYFoeJmUlOgDHD7PWqe
         CuCWkIbtT8mxrrqs/xegyOSKNpJ7F63UbWAgZtB+tvJFDcqEjbERAMjPaDdLzRncsDXe
         1rjce/64pVgiv2T0xtkjuO5ZC+nEAtOA3a70qsKvW6ZatPDB+tE1KCWTyF/JGtPQPNyo
         UbIg==
X-Gm-Message-State: AOAM533l8bMRrGnZoHU4jOXFVSpTELFpG/Iq4TKodJO5MxpNk+sGDRmX
        VQcRyK5cTaRLUd6aiesnnBSg5X88m7g=
X-Google-Smtp-Source: ABdhPJy5V4PzQNsFwPRjFY7tIhVFzGBW5BAl8XLqgwd2QSjytzf0IebopFFPGb7b1wyfgqn5jTYqBA==
X-Received: by 2002:a05:6512:2316:b0:473:b7cb:f5b4 with SMTP id o22-20020a056512231600b00473b7cbf5b4mr10306633lfu.236.1652039730353;
        Sun, 08 May 2022 12:55:30 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id s23-20020a2e98d7000000b0024f3d1daeb1sm1535525ljj.57.2022.05.08.12.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 May 2022 12:55:29 -0700 (PDT)
Message-ID: <46556208-3366-b7e7-4a51-1830461c254c@gmail.com>
Date:   Sun, 8 May 2022 21:55:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: AW: AW: [PATCH v2 1/2] dt-bindings: leds: Add multi-color
 default-intensities property
Content-Language: en-US
To:     Sven Schwermer <sven@svenschwermer.de>,
        Sven Schuchmann <schuchmann@schleissheimer.de>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Cc:     "pavel@ucw.cz" <pavel@ucw.cz>
References: <20220502204616.GA27288@ucw.cz>
 <364df52a196fa0ae5db07e599995fcf8dfafb43e.1651577132.git.sven.schwermer@disruptive-technologies.com>
 <GVXP190MB19174C638935B1C6717F8AEBD9C09@GVXP190MB1917.EURP190.PROD.OUTLOOK.COM>
 <499bce9d-81d1-8edb-3db5-187e86db71f4@svenschwermer.de>
 <GVXP190MB191792BF0B86407C86A43BB5D9C39@GVXP190MB1917.EURP190.PROD.OUTLOOK.COM>
 <74896374-d9d5-2f6c-9340-713f2ee57df6@svenschwermer.de>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <74896374-d9d5-2f6c-9340-713f2ee57df6@svenschwermer.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Sven and Sven,

On 5/4/22 11:24, Sven Schwermer wrote:
> Hi Sven,
> 
> I did consider placing the property into the multicolor's sub nodes. 
> However, multicolor LEDs are not required to have firmware sub nodes. At 
> least the multicolor class API does not make any assumptions about this.

So this is something to be clarified. The whole idea relies on having
sub-nodes in the multi-led node.

> One possible solution that I came up with is to do something like this:
> 
> multi-led {
>      color = <LED_COLOR_ID_RGB>;
>      default-intensities = <
>          LED_COLOR_ID_RED 100
>          LED_COLOR_ID_GREEN 0
>          LED_COLOR_ID_BLUE 0
>      >;
>      led-0 {
>          color = <LED_COLOR_ID_RED>;
>      };
>      led-1 {
>          color = <LED_COLOR_ID_GREEN>;
>      };
>      led-2 {
>          color = <LED_COLOR_ID_BLUE>;
>      };
> };
> 
[...]
>>
>>
>> Maybe it is better to define per Color like this:
>>
>> multi-led@0 {
>>     #address-cells = <1>;
>>     #size-cells = <0>;
>>     reg = <0x0>;
>>     color = <LED_COLOR_ID_RGB>;
>>     function = "eee-led-status";
>>     led-0 {
>>         color = <LED_COLOR_ID_RED>;
>>         default-intensity = 100
>>     };
>>     led-1 {
>>         color = <LED_COLOR_ID_GREEN>;
>>         default-intensity = 0
>>     };
>>     led-2 {
>>         color = <LED_COLOR_ID_BLUE>;
>>         default-intensity = 0
>>     };
>> };

I would go for this. Seems to be the most straightforward solution.

-- 
Best regards,
Jacek Anaszewski
