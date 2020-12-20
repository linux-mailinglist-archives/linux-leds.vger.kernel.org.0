Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 523AE2DF2D2
	for <lists+linux-leds@lfdr.de>; Sun, 20 Dec 2020 03:59:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbgLTC7l (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Dec 2020 21:59:41 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9232 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726882AbgLTC7l (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Dec 2020 21:59:41 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cz6jT4S6zzksqv;
        Sun, 20 Dec 2020 10:58:05 +0800 (CST)
Received: from [10.67.102.197] (10.67.102.197) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Sun, 20 Dec 2020 10:58:52 +0800
Subject: Re: [PATCH 2/4] hung_task: Replace "did_panic" with is_be_panic()
To:     Randy Dunlap <rdunlap@infradead.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Pavel Machek <pavel@ucw.cz>
CC:     <linux-kernel@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <dmurphy@ti.com>, <akpm@linux-foundation.org>,
        <keescook@chromium.org>, <gpiccoli@canonical.com>,
        <wangle6@huawei.com>
References: <20201218114406.61906-1-nixiaoming@huawei.com>
 <20201218114406.61906-3-nixiaoming@huawei.com>
 <20201218125957.GA20160@duo.ucw.cz>
 <eddf7043-4bbe-7440-6c3e-ff272f722a86@i-love.sakura.ne.jp>
 <a2279e36-3665-6328-e515-b12cdc532aa9@infradead.org>
From:   Xiaoming Ni <nixiaoming@huawei.com>
Message-ID: <d5c62a81-2b52-5add-98c9-bb75e9b2f436@huawei.com>
Date:   Sun, 20 Dec 2020 10:58:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.0.1
MIME-Version: 1.0
In-Reply-To: <a2279e36-3665-6328-e515-b12cdc532aa9@infradead.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.197]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 2020/12/19 1:06, Randy Dunlap wrote:
> On 12/18/20 6:36 AM, Tetsuo Handa wrote:
>> On 2020/12/18 21:59, Pavel Machek wrote:
>>> On Fri 2020-12-18 19:44:04, Xiaoming Ni wrote:
>>> Plus.. is_being_panic is not really english. "is_paniccing" would be
>>> closer...?
>>
>> Or in_panic() ?
>>
> 
> Yes, or  in_panic_state()
> 

Thank you,
I'll resend the patch later on according to your suggestion.

Thanks
Xiaoming Ni
.
