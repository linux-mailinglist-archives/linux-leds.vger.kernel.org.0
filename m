Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40CA0A145F
	for <lists+linux-leds@lfdr.de>; Thu, 29 Aug 2019 11:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726070AbfH2JIq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Aug 2019 05:08:46 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:46679 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbfH2JIq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 29 Aug 2019 05:08:46 -0400
Received: from [192.168.1.110] ([77.7.44.18]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N3bjH-1iBChO0vnX-010c52; Thu, 29 Aug 2019 11:08:41 +0200
Subject: Re: leds: apu: drop obsolete support for apu>=2
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org
Cc:     pavel@ucw.cz, dmurphy@ti.com, linux-leds@vger.kernel.org
References: <1563202653-20994-1-git-send-email-info@metux.net>
 <bb7a338b-d86d-5016-7ae2-e893e1934d96@gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <12d2e12f-4157-eb64-6734-db7f1908200c@metux.net>
Date:   Thu, 29 Aug 2019 11:08:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <bb7a338b-d86d-5016-7ae2-e893e1934d96@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:bk46UKSSJSsY5ewyTBOd84ZGPF1MXRbTg+pz0HEYQB8R+Bkc5yS
 iScwJHPY8xCXrPCp8bLdsO9kD6JFQ/jYoWNvRoOH2/AKrxt5IePtaLfLHadluCEYBFbhbnP
 cDyKKf6NYKKng80DD4VzIR/4U37rSgYOq+xACZUZnE1J4OYbYIq1cQ4ZDC5LypJGSyEELqw
 d/WVgF+HfDyB+A+Yz5fYg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZlS4e7wBA8c=:OPAMx9dodqVC8qHmOWnBDp
 zTmhTBsTxYlfQ2BZfEVAIYxIidEQjp9SxVeFqNPgvjmU2Ga73t1VKrjbRI1rjJjQtNglgo/sa
 KFLS7/AROFkIgnBo0t/HQfWhUdBXRBy7MGttdAlOWQy9WJBQinQwiLZbsToNyPRzOVT6SEzFK
 agTPY18wJqVOD5OBz3nYoE9gZby/CtKNesLQfm656uC3CYEjkRohhwfcpsKu0aHiC2DZTFVrr
 woYcQMjUvU1IAGsgQoVJdPoQ7t1hBP7czcDMKRAQlF9ESoJuxOOigqfdSOnNGf6oB8m0orHcn
 JDwTy2klifp4TXdSZEdXcezsSKrfD6xrEnncJbEng5YKbu8UdDc8n/WzGTwwaF7hTTWHRhEuN
 5segvubd10V+G3Jh4wHJE9GUHUls/LEUvrDuqPXSA26M/66bcLeyhpjGDf+XQHhD4uaHK7VXK
 ZM2iHCU94BUcCYkHXrQdMP/FybCll+TohCBI4K/7D/9KykdlpO2q+I4A5eW/h7bLqafo1G+Uo
 sNusOySRzL5IFunCnpx9iqYVPTpIThXFLwwfT3sI+Rl7K5j2sB2Xa9e0/YXk5MXT8H+quMcZg
 0KVx0MYOEV+lxHeXK8D82nQ9SnIQgiX506FbPIglHAb3smr1EBf8yJJV7iycBJBuU4eJCE4/X
 wBT31lxuWFd+jiepQShHgAcdyWZA9N0Tl6H1AIni9eA4AMPhTKogEyqEYgUCt9wADvTKmwyh4
 TvWtPi0cR940o+x1UJ+S10/7VYwfAe8eVG7cqnZaqHu1LMhawpMdyHRVkTa5LlVIR0+pkRPah
 S6j3LH9aSoSWlbhIP8j/JNt6nABgQ==
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 22.07.19 22:12, Jacek Anaszewski wrote:

Hi,

> Patch set applied along with the update for the patch 5/6.

What's the status of this patch set ?
Doesn't seem to have landed in Torvalds tree yet.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
