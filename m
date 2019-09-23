Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04FDFBBDC0
	for <lists+linux-leds@lfdr.de>; Mon, 23 Sep 2019 23:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388866AbfIWVVn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Sep 2019 17:21:43 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41788 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388859AbfIWVVn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 23 Sep 2019 17:21:43 -0400
Received: by mail-wr1-f66.google.com with SMTP id h7so15539918wrw.8;
        Mon, 23 Sep 2019 14:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yDiZLJhE5QfqyJecos8R/R/0KtO0neQxJZxGWvPk/oU=;
        b=Xc1MXyRMf1XN3QaiwjwD+RNZY0Did9AEFkdIBX839fOAfu0zcN2pA2gupdWh+ebhfR
         A8Jqs2egrBgtpKyDifwy0MdyWhfcx0FpkFa8aeVfFzLPOrEdccPP9V6tjy/UnqGEXK7o
         Np2agBCgWBNCn9VoN2jkcFsVAxKKLcRM6asVt/QJvKgCnlDWDIQX+8atnOGH4J6xsNzH
         19LZwcYTf6HyZsOxrAfieF/aI6T+yO23jAjkgbhCLdr4I7bi8102TknAAhXc5MIsy/y4
         w6Kua0LOsctusxvT+R8lOYHyC5NXTi4ap8u1NEZTGdErNiZe8Oq8v5h64xrKsVJyTqOT
         D6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=yDiZLJhE5QfqyJecos8R/R/0KtO0neQxJZxGWvPk/oU=;
        b=MpwV7cPf7ui9fqqdJL1et1+7bw2HZUs5OrhdwcIjvBfA1+5/sQI9m6k9Yq0Anf9Un1
         XD3PRHX2uY4T7N1vegprEX978JpgltgYFvHSra8qhoQykG24Qp70CxntDSqAmiSr0xJK
         QBELh8KINRomi3lVpRutGua2Y7Svyg/BImthzK1+B+u0Gzipdzm0k/8AQTLsyytpyndA
         KFOjQj9ehYIdH93qvavs7nCGdEM5EOVESSg54GHElsCXmrRfu+PPfd8oVkCRDlsmVpWu
         ZAfT2EPDfAIQHPOwK/Xp1ZkoJEeGSrlRhTZXzlOA+HS5jttviUoGawkpJd8RJsDE7Vy8
         DQ0w==
X-Gm-Message-State: APjAAAXEGCxq+qsj/Oa32BAg2TxE+brsjBUOb2GslMYoApn3PHlUY8xq
        4OPerB0Q2SNAZKalxvnePUCzBzh4
X-Google-Smtp-Source: APXvYqw8BMdw/K+S2Aatyt9aUv5sU+9FztJ1EAP6H/Y1J0UNT0R3mecr8hqxQ53nutNUUC69WnZqEw==
X-Received: by 2002:adf:fa10:: with SMTP id m16mr958942wrr.322.1569273699477;
        Mon, 23 Sep 2019 14:21:39 -0700 (PDT)
Received: from [192.168.1.19] (bdr247.neoplus.adsl.tpnet.pl. [83.28.3.247])
        by smtp.gmail.com with ESMTPSA id c4sm10118294wru.31.2019.09.23.14.21.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Sep 2019 14:21:38 -0700 (PDT)
Subject: Re: [PATCH v8 2/9] documention: leds: Add multicolor class
 documentation
To:     Dan Murphy <dmurphy@ti.com>, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190920174139.30079-1-dmurphy@ti.com>
 <20190920174139.30079-3-dmurphy@ti.com>
 <2f2d40d7-aa4f-a38d-19a7-425a111adb64@gmail.com>
 <56d9a7a6-7cdb-8ac0-5e41-f45fad914c55@ti.com>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b49c11e5-7271-b1a7-6f51-dba1dd7c1e26@gmail.com>
Date:   Mon, 23 Sep 2019 23:21:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <56d9a7a6-7cdb-8ac0-5e41-f45fad914c55@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dan,

On 9/23/19 4:50 PM, Dan Murphy wrote:
> Jacek
> 
> Thanks for the review
> 
> On 9/21/19 7:28 AM, Jacek Anaszewski wrote:
>> Dan,
>>
>> On 9/20/19 7:41 PM, Dan Murphy wrote:
>>> Add the support documentation on the multicolor LED framework.
>>> This document defines the directores and file generated by the
>> Now there will be one directory created.
>>
>> Apart from that - all documentation should go in the same patch
>> as the feature being added. So patches 1,2 and 3 should be melded
>> together.
> 
> I think only patches 1 & 2 should be squashed into a single patch.
> 
> Patch 3 are the dt-bindings which should be separated

Right.

>>> multicolor framework.  It also documents usage.
>>>
>>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
>>> ---
>>>   Documentation/leds/index.rst                 |  1 +
>>>   Documentation/leds/leds-class-multicolor.rst | 91 ++++++++++++++++++++
>>>   2 files changed, 92 insertions(+)
>>>   create mode 100644 Documentation/leds/leds-class-multicolor.rst
>>>
>>> diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
>>> index 060f4e485897..bc70c6aa7138 100644
>>> --- a/Documentation/leds/index.rst
>>> +++ b/Documentation/leds/index.rst
>>> @@ -9,6 +9,7 @@ LEDs
>>>        leds-class
>>>      leds-class-flash
>>> +   leds-class-multicolor
>>>      ledtrig-oneshot
>>>      ledtrig-transient
>>>      ledtrig-usbport
>>> diff --git a/Documentation/leds/leds-class-multicolor.rst
>>> b/Documentation/leds/leds-class-multicolor.rst
>>> new file mode 100644
>>> index 000000000000..063c9a411a1d
>>> --- /dev/null
>>> +++ b/Documentation/leds/leds-class-multicolor.rst
>>> @@ -0,0 +1,91 @@
>>> +====================================
>>> +Multi Color LED handling under Linux
>>> +====================================
>>> +
>>> +Description
>>> +===========
>>> +There are varying monochrome LED colors available for application. 
>>> These
>>> +LEDs can be used as a single use case LED or can be mixed with other
>>> color
>>> +LEDs to produce the full spectrum of color.
>> I'd say it won't be the most frequent use case. We can expect rather
>> compound RGB, RGBA[UV] etc. LED elements being connected to iouts of
>> multi color LED controllers like LP50xx. TI mentions RGB LEDs in its
>> application notes for instance. I'd mention that in the first place
>> and leave what you have above as another use case.
> 
> Which application notes are you referring to?

I don't remember if it was titled exactly AN, but I do remember a sample
PCB design using RGB LEDs mounted circle-wise to achieve the demo
sample shown in the TI LP50xx presentation videos we were discussing
somewhere in last Jan/Feb/March.

-- 
Best regards,
Jacek Anaszewski
