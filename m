Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B122522692
	for <lists+linux-leds@lfdr.de>; Wed, 11 May 2022 00:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbiEJWAr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 May 2022 18:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235185AbiEJWAn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 10 May 2022 18:00:43 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44CF729B010
        for <linux-leds@vger.kernel.org>; Tue, 10 May 2022 15:00:35 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 16so242301lju.13
        for <linux-leds@vger.kernel.org>; Tue, 10 May 2022 15:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8wl4JGjcagTE5DTXgovuMHC09QoMON5V3iCY7oQVcUY=;
        b=iMLbaUxacpJCVUqtGpBpcjGut8v/t0M39DdzYHX0k9Wkfa4QZm7ZEWEuA//hHCbINu
         62HVf5Uns/s4gefd1qOxG7WmVduKvUz2UMOVgnwmn0QHlKsfH83cdv591pkoqhOBTDEZ
         XfO3fyX9yq1ipSIP5FIhGoD1CT2X/RIMetQRbxqAjm/m2L896muotvzNLdQJxRR32mbd
         xYCEQc9oWZixV3Xta5S9y2PSB6x35y8eDJRoswxTF29e32B7bPsQgz7h2bmMrH49swKO
         eyg8CdW/EGMLX9XCgvaKDGVsk33H25P5Od5N3ZcPkORmTSK/zM2VRdBFGK/Sbi5ji5ol
         whYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8wl4JGjcagTE5DTXgovuMHC09QoMON5V3iCY7oQVcUY=;
        b=ohiHoEbPP7oh0Z89ICVmD9h7OuSs35Ce8l69UzCPcAHXuZOlJVaiEGrg3EcjNGzFor
         NeZQiHVH2smpmbw/U3p0iTwCh+e6QJUFYjKGGzjLNHdEb4e/Mnh9W49W/OMDv0M0pNII
         6F3S9B2EoKhU8k0ZB7Vo/+6sn+IVELzMx6Ik2MnwQv/m87GWY7CbkUYZaETNfUnPo4P+
         vJEMmnOAIJAZi3ICJaN1SGPZMwmxmlsaB0f6c6Gbtsf2sy82sj2hrlvkF88J7/Uhxpx3
         b9EUiQ58S9fHTCF3Q8inQEO6W3OlGiiWujgHppZfSKLiyF3Ek6yXlRm5FHigFHA/7Le1
         Gvsg==
X-Gm-Message-State: AOAM531ohNjH5USWYfxTUHtjfXoHD8IovrVEYNaseuG7/enW/8pv3Cj9
        hWKuz38U9oAd/n2rPlJP1mw=
X-Google-Smtp-Source: ABdhPJwl8J4eR7sn0+VIZMDFYxlG5Kw+aYEy12fGMGa/ftleO5Suh93XVjPNm5Di/aHFuBYU23GoLw==
X-Received: by 2002:a2e:54b:0:b0:24f:1055:194c with SMTP id 72-20020a2e054b000000b0024f1055194cmr14753410ljf.106.1652220033496;
        Tue, 10 May 2022 15:00:33 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id m9-20020ac24ac9000000b0047255d211d7sm20694lfp.262.2022.05.10.15.00.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 May 2022 15:00:32 -0700 (PDT)
Message-ID: <9209a2da-a201-d58a-3cb2-9d2ef7ae9a2b@gmail.com>
Date:   Wed, 11 May 2022 00:00:30 +0200
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
 <46556208-3366-b7e7-4a51-1830461c254c@gmail.com>
 <3a016b38-57d2-e8d0-0162-734829aa0419@svenschwermer.de>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <3a016b38-57d2-e8d0-0162-734829aa0419@svenschwermer.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 5/10/22 20:31, Sven Schwermer wrote:
> Hi Jacek,
> 
> On 5/8/22 21:55, Jacek Anaszewski wrote:
>> Hi Sven and Sven,
>>
>> On 5/4/22 11:24, Sven Schwermer wrote:
>>> Hi Sven,
>>>
>>> I did consider placing the property into the multicolor's sub nodes. 
>>> However, multicolor LEDs are not required to have firmware sub nodes. 
>>> At least the multicolor class API does not make any assumptions about 
>>> this.
>>
>> So this is something to be clarified. The whole idea relies on having
>> sub-nodes in the multi-led node.
> 
> As far as I understand, multi-color LEDs don't require actual OF 
> sub-nodes. The Turris Omnia LED driver doesn't have sub-nodes, see 
> Documentation/devicetree/bindings/leds/cznic,turris-omnia-leds.yaml

Ah, I forgot about that one and the related discussion.
In this case, yes, global array will do.

-- 
Best regards,
Jacek Anaszewski
