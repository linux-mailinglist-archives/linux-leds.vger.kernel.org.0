Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5520C7271B4
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jun 2023 00:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231643AbjFGWa1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 7 Jun 2023 18:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbjFGWa0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 7 Jun 2023 18:30:26 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBB2E11F;
        Wed,  7 Jun 2023 15:29:52 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-256531ad335so6434621a91.0;
        Wed, 07 Jun 2023 15:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686176992; x=1688768992;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=grsDBqe7yk4jc/jPIZgFmp/seq5dvq91MXFPyPq76NY=;
        b=lZmdyXvhkL+I/p0/O5+c9fSc4znjTE9ZWooBILdYmG30DmpVQBSgtnyVVoIQA+jUWk
         /d1utBBXUki1G9+pNAgRfKyUCSD+o9RwQEeL1kyiJ7JUSlVxFWT7wIUKkEbzOsLqr8xb
         tuTMTAQLxwYeQzTFO3W8zxr0C2OQs/nAlb1/7rPHyP/9Mpv9thdWPHfCkVR22pDUWQQo
         w/f2lp8NVu6IHQTxQ2qpz9lUJozFCxNJxGkSf9urbp/FBhCAUnv4lwybLWgjx91Satvy
         ZTfVkzDC/D6CvweBv0DI1zMCYiGKZ74+qp8dDD2ya6VpOytxQsT/iiGtrgedG+hoBook
         aRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686176992; x=1688768992;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=grsDBqe7yk4jc/jPIZgFmp/seq5dvq91MXFPyPq76NY=;
        b=VNmdtxwMlJKY8+jYA8DabWTkFN5gdtXUdEu5FyuhMJoQKoFVFuwgTl6M/GGVEoIHLy
         LmhWrT+Sjlp1vOcABFh0oj3cnXHNbz/ivCogfE3f02BJWqoj8Yi6r3q6aISc8wAYSIhP
         CsOD4Pszwf02E9ospJ9LKZQD/oVa/iS/NbjHDk0INbcOT/VBLjLKnYWbCDFyed6cokhE
         IVMli4egH1F2Hu5xIlcb7odcUqUXneoehZk27+e+fluIDboJYGBoBjE5jM+PDW6Zh8JX
         x20/5JTXmNjEjQjwrrBlngtGW/lcxFeXWDD8cqQ1QFppsRWfPnSuJXnGER8CJ9SlMzCI
         fDeg==
X-Gm-Message-State: AC+VfDwN1MtTPIsqewwpRWJ3Y0g4+cI5fQ9FtWodfyAf3QhbzmmJVw5O
        v6d7n2atQyUOKIZ6hiBFzBc=
X-Google-Smtp-Source: ACHHUZ4aO/KMCktl3HA8PmmtvGB3Vk+MESjxfD+vbAvX8bKgKrv+R/F45XqGTlTZX6wNEnCUvlHRXQ==
X-Received: by 2002:a17:90a:ea86:b0:256:845f:333a with SMTP id h6-20020a17090aea8600b00256845f333amr6169247pjz.19.1686176992196;
        Wed, 07 Jun 2023 15:29:52 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id q34-20020a17090a1b2500b00250ad795d72sm5151pjq.44.2023.06.07.15.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 15:29:51 -0700 (PDT)
Message-ID: <11182cf6-eb35-273e-da17-6ca901ac06d3@gmail.com>
Date:   Wed, 7 Jun 2023 15:29:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: NPD in phy_led_set_brightness+0x3c
Content-Language: en-US
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
References: <9e6da1b3-3749-90e9-6a6a-4775463f5942@gmail.com>
 <c8fb4ca8-f6ef-461c-975b-09a15a43e408@lunn.ch>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <c8fb4ca8-f6ef-461c-975b-09a15a43e408@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 6/7/23 14:32, Andrew Lunn wrote:
>> There is no trigger being configured for either LED therefore it is not
>> clear to me why the workqueue is being kicked in the first place?
> 
> Since setting LEDs is a sleepable action, it gets offloaded to a
> workqueue.
> 
> My guess is, something in led_classdev_unregister() is triggering it,
> maybe to put the LED into a known state before pulling the
> plug. However, i don't see what.
> 
> I'm also wondering about ordering. The LED is registered with
> devm_led_classdev_register_ext(). So maybe led_classdev_unregister()
> is getting called too late? So maybe we need to replace devm_ with
> manual cleanup.
> 
> However, i've done lots of reboots while developing this code, so its
> interesting you can trigger this, and i've not seen it.

led_brightness_set is the member of phydev->drv which has become NULL:

(gdb) print /x (int)&((struct phy_driver *)0)->led_brightness_set
$1 = 0x1f0

so this would indeed look like an use-after-free here. If you tested 
with a PHYLINK enabled driver you might have no seen due to 
phylink_disconnect_phy() being called with RTNL held?
-- 
Florian

