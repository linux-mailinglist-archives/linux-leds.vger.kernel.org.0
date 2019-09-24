Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C28D6BC808
	for <lists+linux-leds@lfdr.de>; Tue, 24 Sep 2019 14:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729460AbfIXMm0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Sep 2019 08:42:26 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:48591 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729455AbfIXMmZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 Sep 2019 08:42:25 -0400
Received: from [192.168.1.110] ([95.114.122.209]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mzi3l-1i02gc3vnd-00vbpb; Tue, 24 Sep 2019 14:42:20 +0200
Subject: Re: leds: apu: drop obsolete support for apu>=2
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org
Cc:     pavel@ucw.cz, dmurphy@ti.com, linux-leds@vger.kernel.org
References: <1563202653-20994-1-git-send-email-info@metux.net>
 <bb7a338b-d86d-5016-7ae2-e893e1934d96@gmail.com>
 <12d2e12f-4157-eb64-6734-db7f1908200c@metux.net>
 <30474762-eb84-962b-8854-652679d968f3@gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <07ebdc41-2acb-86cb-2c58-6a43f325e938@metux.net>
Date:   Tue, 24 Sep 2019 14:42:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <30474762-eb84-962b-8854-652679d968f3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:cOHseh//U8Y+pVRSXC5Eu5PK06xmXH+9pMsmV+iJ2ZKNwD7cvLB
 pc1n8M+BlpX0oGL9WrXwqHqx8u4SxTvLZkCCojMYFgE4D0/pzLdJJDmsmhXvPVnlLiuFX8+
 r3AXVuaa+t6wDfVknNkD/ZTR/SBAGGn1sypcHLmXX2S44MbbEeKqaJLaO/tzfSsa9xvgbRL
 8XxenFd67RzF9Qibfadyw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aYYsetKsU3Q=:GvWAGUfRS6YRyIHHnwWy7E
 uIOOoiggurZ3VMxY4ocAE7rrLKhyiOgfz0DhLuPbHKA3JUuqV1Cy0cp/GD8lCziVyhT03pVkG
 JgdfiVrJluRP3UHNzZxN+lwbuvABQCOt1cya26zTs+0nKmV4B/4LzJptvEWl373RNZpAZphpq
 IIfSgRhnc1HKbVFuZCh2Og4AOx/IO+UNu1bxLbVJhuMZhiKr7v6g6gbMz/0Iulekvl0cQF+P7
 lbIzoJmFxgUSyJPjrcUfYguXo521258KajRSlam+30d59bZdrE09xasaNXY6bkxh6xd/ZGRPF
 lbUqAgFlghjU1VxOLgl0fK+uX0tNqu0Tkz04gYP0vcIFgPsrcPDcZik/W78fY1hmpNoID/yfg
 cV7CksWcO5jT/lOyjy+gn+UHRP+//8Ry2R36x19+UpytpxwNwzoXhm2clTRP2iBDM4mYmC94i
 Cm5/iZ+TXb0fabCWBYECb33mrySnQ8POLu8245AXAl4PHtOEXtw7mpyQuu36pkK6wom39yOPE
 uNeE5cdfA29/C08RO3nhOZFYurCIL5qxXTPsm9KRe+z+1eJDi14Ib10qAg41AoyZWibouk4JS
 thIC9jguezSo5OnOa3mXIVO0AZCD8td1z404OIanetel+YKQ3BfxTruE3oj6CNmfbDIF6tCB9
 ht2WzMs9ZsgmP3ulr8oMOZRNsO27OGPyuzrYjSEAEesmV9NCpm0861UDZEBDUuXZEb2kClaHo
 J/d0Umshw156xzU+dJ5movhhrFoaYMabN2opXS7d9oyZI67MT8qRBpnUjWUPSAKlUhXk7xHVh
 AprmL92TgMK5oZSPezwuyzLyZ5HJAndSPFfY6xZu8+TsO62x8dNkg8qs2QOFKkgVSFz7z+o64
 cP6JZ5TpMg0Hxq6pp7nw==
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 29.08.19 21:51, Jacek Anaszewski wrote:
> On 8/29/19 11:08 AM, Enrico Weigelt, metux IT consult wrote:
>> On 22.07.19 22:12, Jacek Anaszewski wrote:
>>
>> Hi,
>>
>>> Patch set applied along with the update for the patch 5/6.
>>
>> What's the status of this patch set ?
>> Doesn't seem to have landed in Torvalds tree yet.
> 
> It is in linux-next and will be sent upstream for 5.4-rc1.
> 

Thanks very much.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
