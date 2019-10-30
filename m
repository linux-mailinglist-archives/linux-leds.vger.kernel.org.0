Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6409CEA4F9
	for <lists+linux-leds@lfdr.de>; Wed, 30 Oct 2019 21:50:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbfJ3UuX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 30 Oct 2019 16:50:23 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38585 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbfJ3UuW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 30 Oct 2019 16:50:22 -0400
Received: by mail-wr1-f66.google.com with SMTP id v9so3874136wrq.5;
        Wed, 30 Oct 2019 13:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BfI6/HaSXjtet8iaHMSaHc180MTq3gkxLjqoXGwpgo0=;
        b=CJORTo7I12WeBS0TO+1K2ucutPmqi8lg2v9GQ14Y2fwAGraP4eZ7WsmKqlrX4Y2AnM
         oK4xvyes8aWqyMLYfKnDNeca2yxdTUxMNY/KVoIDMTo5nmNbIRFhAHCeu21oq1QkGuYb
         jiZP83Z/56A9qXrCgRyAXG6ExpeWEyotV8saND2XpsttWUh8/CkTb5Njuj4UbcL1nru5
         ZJ5uLJ+33uaDHE34EnQNZEyc8NBZWLxNyJ6ErTRme0CnZxsnIZO10vtO5yPk1yUOh8h4
         IqqnvcidB0OO+h9woqLcPygXp6mk05+hsoumcFo8fqXNPUsrnT4ZMDXdbOGq/onTnfYA
         f3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=BfI6/HaSXjtet8iaHMSaHc180MTq3gkxLjqoXGwpgo0=;
        b=r9fgS143Dg/Ubv+qOOsv43ZrjXjsTfPXUJFoMPLwG3j6p1f7Q+iWuXKI8ZXglWe+Nr
         zajVSs0OaGF55sAq/xmg9XiN9In98FepcUG/8qEM1eF1meiKe4tJsXrAgt0w6WoaFmkE
         ke4GPItB9iH6kc+7MZuTgtam1Ky/ntvL56Pf0Q2l5WmilaxsPl2Fvs0pYU46IxaxJZf+
         iFsR2tNRcZ+y/kqhdImSTs88N4vxYrTcespAWkg/smQ0E9cG0OfGNPGgvGJvvg7nrXIg
         hulFk9GI1/FtXsKIxavJCfsCgI7C24nhUgORd2hlY6e5VSAdMLRwlrz1/sbHVSAWFmsg
         PWSg==
X-Gm-Message-State: APjAAAVHVqC/Rpp7BMqBjAuj9uh8qCTV0OVAFP/h5nDg+wQ51+HtVh/1
        LU8q8bzy0u90X7wgrK2zECN7g0jY
X-Google-Smtp-Source: APXvYqyAd+GuL2tk0Kq3gLs+VasEVjv/80fXdOrTiyg6l/FDFjJidHdbpfPJvxmh5k+VFjCbGjAzLw==
X-Received: by 2002:adf:e5c4:: with SMTP id a4mr1812548wrn.334.1572468619547;
        Wed, 30 Oct 2019 13:50:19 -0700 (PDT)
Received: from [192.168.1.19] (bkv74.neoplus.adsl.tpnet.pl. [83.28.189.74])
        by smtp.gmail.com with ESMTPSA id q2sm1083957wmq.30.2019.10.30.13.50.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Oct 2019 13:50:18 -0700 (PDT)
Subject: Re: [PATCH v15 06/19] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
To:     Dan Murphy <dmurphy@ti.com>, kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191028183629.11779-7-dmurphy@ti.com>
 <201910302027.2hNdR993%lkp@intel.com>
 <bb3473ba-ddfc-2b51-4a75-c23c5bf3bc62@ti.com>
 <075c9330-a9b5-1360-4447-71a4797553a9@gmail.com>
 <f32e2063-3c56-607c-0e74-f75f68e62e16@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b50fa8f6-1a27-ad22-d4a7-37bc07fc6768@gmail.com>
Date:   Wed, 30 Oct 2019 21:50:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f32e2063-3c56-607c-0e74-f75f68e62e16@ti.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 10/30/19 9:23 PM, Dan Murphy wrote:
> Jacek
> 
> 
>>> Does not appear here
>>>
>>> Finally not sure why the MIPS compiler is complaining about this but the
>>> ARM and x86 is not
>> Compilation breaks also for ARM.
> 
> Thanks for the information.
> 
> I am not seeing this issue or even a warning when using the ARM 8.3
> toolchain even in a clean build.
> 
> arm-linux-gnueabihf-gcc (GNU Toolchain for the A-profile Architecture
> 8.3-2019.03 (arm-rel-8.36)) 8.3.0
> 
> So is a bug in this toolchain?

From what I've just googled C specification allows for a compiler
implementation to accept also other forms of constants expressions
than standard ones pointed out in the spec.

So this is not necessarily a bug.

-- 
Best regards,
Jacek Anaszewski
