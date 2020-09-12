Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70F8E26773C
	for <lists+linux-leds@lfdr.de>; Sat, 12 Sep 2020 04:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725765AbgILCYO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 11 Sep 2020 22:24:14 -0400
Received: from m12-14.163.com ([220.181.12.14]:33449 "EHLO m12-14.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725562AbgILCYN (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 11 Sep 2020 22:24:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=QMo56
        RhklZ2LepW7CTmbVzItjGLs4oQqQgOIOoy4EJ0=; b=jl3DmpbkJvv1blArBxvUR
        LxxlyFr2VK6eun+wAVTY9itRY7EWNDq0WLcGY9i9b5ltDexaxs80TArIg6GCpUNL
        L0926CxhVA1RVQ2NGQBblWAnGIo1ztwHOpvsclrTnklDecmvH8fB3OP36cXTBRUm
        R/eOBHzwty6GA1r7fMSYuI=
Received: from [192.168.1.166] (unknown [58.33.126.61])
        by smtp10 (Coremail) with SMTP id DsCowADHzVEsMVxf83FjKg--.8433S2;
        Sat, 12 Sep 2020 10:23:41 +0800 (CST)
Subject: Re: [PATCH v3 1/2] leds: is31fl319x: Add shutdown pin and generate a
 5ms low pulse when startup
To:     Pavel Machek <pavel@ucw.cz>
Cc:     jacek.anaszewski@gmail.com, dmurphy@ti.com, robh+dt@kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200825082206.26575-1-von81@163.com>
 <20200909091825.GA14289@amd>
From:   Grant Feng <von81@163.com>
Message-ID: <68948033-6d74-a10f-c81f-ee65a528032d@163.com>
Date:   Sat, 12 Sep 2020 10:23:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <20200909091825.GA14289@amd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsCowADHzVEsMVxf83FjKg--.8433S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUyPkuUUUUU
X-Originating-IP: [58.33.126.61]
X-CM-SenderInfo: xyrqmii6rwjhhfrp/1tbiNw2dOlWBh8RtKAAAsP
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Thanks for the info.

Best regards,

                                                 Grant

On 2020-09-09 17:18, Pavel Machek wrote:
> On Tue 2020-08-25 16:22:05, Grant Feng wrote:
>> generate a 5ms low pulse on shutdown pin when startup, then the chip
>> becomes more stable in the complex EM environment.
> Thanks, I applied the series.
>
> Best regards,
> 								Pavel
> 								

