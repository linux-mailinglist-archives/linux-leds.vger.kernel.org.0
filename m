Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88B71EA7D
	for <lists+linux-leds@lfdr.de>; Mon, 29 Apr 2019 20:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729027AbfD2SuL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Apr 2019 14:50:11 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:33621 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728300AbfD2SuL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Apr 2019 14:50:11 -0400
Received: from [192.168.1.110] ([77.9.18.117]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MSKly-1hEYZG3fFw-00Scsl; Mon, 29 Apr 2019 20:50:02 +0200
Subject: Re: linux-next: Tree for Apr 29 (drivers/leds/leds-turris-omnia)
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Marek Behun <marek.behun@nic.cz>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org
References: <20190429190354.0d5e2e93@canb.auug.org.au>
 <d3822785-0683-28df-ffa6-ab679aa27c73@infradead.org>
 <20190429153200.GA11761@amd> <20190429173842.06f02852@nic.cz>
 <20190429163753.GA16782@amd> <20190429184439.68049050@nic.cz>
 <20190429165319.GB16782@amd> <c045db7f-2147-1a58-8d65-8b52fddd932c@metux.net>
 <20190429181245.GA24658@amd>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <ccf6596b-e645-a9b3-dfab-96ff14e8b70d@metux.net>
Date:   Mon, 29 Apr 2019 20:49:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190429181245.GA24658@amd>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:zGfXCLYBSmX7P+WkkUZILULmfPr5eBnqWaUBczWdpgg2G5d6AxR
 9TDoFm8STs7jLJi5GW80l8LZI636jrOxfsbhtUI7ITisX+kRhRGNYKCnKy9xG720n3DmBsq
 q1ECTBlmxonjXz2AL4TxVeM0JCx4cAAukQWyTLMa0RvhP3UWTeK7PSF5id7J25qs9+HLs5Z
 i5D2h+kzjME9meOfDWj+A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xVlNTsRc4B8=:W/bhq8VWzottdTZGimp6Sh
 vpSfBllTERQvLSnxMLCNa9R6XuiR8UUdaCL7KYUay+NLCMli7+6/rqnUqcCjnQLzW1NqIVJcH
 SIo/J5K8r6XtaMx9GY9qE8wkEgReaLx54bs4W7F+A5MpZnx+xZGDbbHdBONbNaaVUk6cpmOeV
 Uk+05TufwWBw+gygU3cJJoIXjuKseezHXln9bQaDqNueKaW1mNbWgWcM4LRsH9utE41CJUlzR
 d4XYK2XI6uGBPNGjJQn88/lQiT7Jc1Qg9yCLPIRa8WNncxQn2GeR6eKh/cuXnkiNIuooGkerH
 4vwmFSFdbf7xfpJqta+PnAHKMTrRSAlN5wdJJkfeMFPF0P644MlSA6pVx3DGQ8zF9lq1XohZU
 tSlooWLtXw+OMiYnAKoQAwojtrQBzjrC2BO2/aF+rW/X5RuzqJTi9834TgvmvpF8VKjCUAiJc
 uNEKHFZz9w0UKo+tr2f6z59s9gCIbM9C8sI6PF1AxSg59VEy/BuVbSWDhXZ9JVtNQlgtMTTbm
 A1UAsgMGqKUAAUbKPyY7UDLu2281/kwiNO0OuDjkUKU6pQThMRr0GLyvdNrs+gLY60L48rZG1
 Kgihsu88+cjDSi+APNjnyERCs+ZaEjQX2hE8UCvJX12lmI3XSI3JJOk0JfuRwH7LOp2gzg6Yi
 LV+p4MZ3yjQLRwspKvN5+DCDZ+kPaeMSfZrlGOpLp0I7wtqO+RxgR+5M8AoW0H+WbvVaNCtx8
 4CTe+PPwznE5pDBDZL2OKll9ItdF6soLqP22O2j6a5eJeEx++2yxJNgjn2E=
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 29.04.19 20:12, Pavel Machek wrote:

>> Is that controller only built-in into some SoCs, or also available
>> as a separate chip ?
> 
> AFAIU.. separate chip, but runs firmware not likely to be available
> outside Turris routers.

hmm, if it's a separate chip, IMHO it should be selectable, so that
anybody who puts that chip on his board can directly use it.

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
