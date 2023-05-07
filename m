Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F69F6F9CA5
	for <lists+linux-leds@lfdr.de>; Mon,  8 May 2023 01:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231961AbjEGXLh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 7 May 2023 19:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjEGXLg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 7 May 2023 19:11:36 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 502E67ED1
        for <linux-leds@vger.kernel.org>; Sun,  7 May 2023 16:11:34 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 72335846E0;
        Mon,  8 May 2023 01:11:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1683501091;
        bh=XClQi6IV1faU3jsFLMw7HbLhHvx9X66EMVK8G+WqV0A=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
        b=ePLw1lWLH48/rRggi0CZQHbOrrrI0GUULM12/0xxiFJTzkuuIMWjobhWSsppEcOU8
         dWEolwUVdevLLheYGZcStugKqQl8ISP/7bHDim1MDzawYQwqjH3FUYbb8dwXTH9NcM
         sJYgHfQO6yv2OGue/dF4Bt184wgn+eihzVcQ29ZH0i9bOD6A/jSBQEaZjF9PDGZQSU
         NuUSQENPWNWmAVqZLDlNFpIvho8VROGQWw1x4duH8YfZzirVvM2TnwtaeZcPPQ9NYn
         QKfiV2IYtUebMELOCxY3hKM47bzRaJFbefjq1HnnYdubrCYy+RMKUh6643MXxyTSsk
         OsCUmhwN38FCQ==
Message-ID: <1e22f00a-490a-503d-463c-d7d4df1da64e@denx.de>
Date:   Mon, 8 May 2023 01:11:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] leds: gpio: Configure per-LED pin control
From:   Marek Vasut <marex@denx.de>
To:     Pavel Machek <pavel@ucw.cz>, lee.jones@linaro.org
Cc:     linux-leds@vger.kernel.org,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>
References: <20221107003133.377704-1-marex@denx.de>
 <ZCGE/6hzeJNeJKTj@duo.ucw.cz> <5156c474-9f44-6cda-6090-c3e58f7459f0@denx.de>
Content-Language: en-US
In-Reply-To: <5156c474-9f44-6cda-6090-c3e58f7459f0@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 4/2/23 23:58, Marek Vasut wrote:
> On 3/27/23 13:58, Pavel Machek wrote:
>> Hi!
>>
>>> Each gpio-leds DT node DT subnode can have a pinctrl property assigned
>>> to it, parse the DT subnode pinctrl properties and configure each pin
>>> accordingly.
>>
>> Do we need update to
>> Documentation/devicetree/bindings/leds/leds-gpio.yaml ?
> 
> As far as I can tell, no. The pinctrl properties are generic and outside 
> of the leds-gpio yaml schema.

Are there any further concerns or can this patch be applied now ?

Thanks!
