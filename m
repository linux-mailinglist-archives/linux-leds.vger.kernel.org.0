Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B343E986
	for <lists+linux-leds@lfdr.de>; Mon, 29 Apr 2019 19:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728893AbfD2Rv6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Apr 2019 13:51:58 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:60255 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728877AbfD2Rv6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Apr 2019 13:51:58 -0400
Received: from [192.168.1.110] ([77.9.18.117]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MKbXu-1h4jWO3fyu-00Kxe6; Mon, 29 Apr 2019 19:51:44 +0200
Subject: Re: linux-next: Tree for Apr 29 (drivers/leds/leds-turris-omnia)
To:     Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org
References: <20190429190354.0d5e2e93@canb.auug.org.au>
 <d3822785-0683-28df-ffa6-ab679aa27c73@infradead.org>
 <20190429153200.GA11761@amd> <20190429173842.06f02852@nic.cz>
 <20190429163753.GA16782@amd> <20190429184439.68049050@nic.cz>
 <20190429165319.GB16782@amd>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <c045db7f-2147-1a58-8d65-8b52fddd932c@metux.net>
Date:   Mon, 29 Apr 2019 19:51:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190429165319.GB16782@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:g+r0ZhlbwROpeWoU6iGoaXxinnfCyiPF0qlNNExijXz02hsryGK
 faUPZl9mJ+r6hiIt6z8DuwE/pIFjHKplJD5LSyOqL8BoCeklQg39uimKMjXhzXWE9ye39Lm
 +akXtpFesXmnuTj2GCWRNtJMemhEpgY4F/P5rAWlm0/eL0PMxzDSbs0riKjA7fUaIblipQi
 KTEhWu0u3XXILISzelPmg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:W5zUZ1YphWI=:xM28DrNPgTERo4NJdBAdHC
 loEfzVq5Oq2/x2KjsZGFjd2fDDluxaQ0abqE1u1vPfonJYleXxTqcME3pYB4/ZG8e/H6a8mpV
 ut6nxYUKXiI4rFsc0PtnIbYIYpZn6gG765/fhiWcwYdgDYGZaSjwBmb05kwt62jeegOS5hqK1
 kq2W1vWM/py5cFuCpta9fq03g5Bmej8MEWIPvTh1XbHkAWMm1nlM0/4Mlvr5jOnLU9hX7HVRB
 i39Gj0IBgIozkAGMu39Um5axvwSP5AaiNOl7Wrv2/H7lYX5nLklJylgn0XHYhQNnEP5c8S1AW
 uWx95IWwbjPzUnOaol6XWMOZBCfvtk/+zn+R9PXSX15GTm6tgneNetwT33kjmdsECF1/xsz+e
 V4bhv6BQRxBZmtIJAm9l7IoJ+ZithAHLQ1ISz+Be+OQ16fAslX+NPKQ5GIwbPh8O6Bpj4YtqJ
 pAysGb8JysKrFC//Hf82eHUmjcWN4BNhwNG4VZA3Wqh3qJ5UeIaB+wMFdPMUbD9pbfDBYWHVl
 d+OYVJH4E/g6LOAHhMAcrw26bzJY5ToIAzYfAdM9J0qv23lrADTh/QXZA8NypZtZXOKno3bkP
 WFG/6UH+TmVATU2u2agyeMJ7/uE6NIPu4mkVe6qnNQaaRtPQYE3SqxryT94Yq2ZrLX0UP/s2I
 I8lIb6tn74qTiWHWmg+pp/tnLfjMebFPEk7Fr4zAR9qHfDpxaWUUHLOXBMk0rr7DkDxNLvtAF
 dzEudi+TUdMQhitpI5bI6R0t5TYSSCBRURYiIF16kl2CwE3cYcNkO/hhJlkyFWqjVcsdoEiPV
 uM0XfQkTnrSycl1L1mrdOhX+DZCoAgfN4VImGfqwh8BVLw2ULF+i8rEXvIZCP51wyAWSjDc
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 29.04.19 18:53, Pavel Machek wrote:
>>> Theoretically. But we both now that probability of that is very low,
>>> and that likely driver would need other updates, too... right?
>>
>> What would be the benefit to add ARM dependency? So that distro
>> compilations don't ship the turris_omnia driver unnecesarily?
> 
> That, and so that people are not asked "do you want to enable omnia
> LEDs?" when they update their kernel on i386.

Is that controller only built-in into some SoCs, or also available
as a separate chip ?

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
