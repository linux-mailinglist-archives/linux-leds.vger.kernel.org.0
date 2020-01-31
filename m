Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F354D14F0C1
	for <lists+linux-leds@lfdr.de>; Fri, 31 Jan 2020 17:42:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbgAaQmd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 31 Jan 2020 11:42:33 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:35022 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbgAaQmd (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 31 Jan 2020 11:42:33 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00VGgKxq064784;
        Fri, 31 Jan 2020 10:42:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1580488940;
        bh=qzzR6Id7uzDGRZnEt7ZRwhYlAQLF48xBx5ZTss8fi0w=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=KXG75xBsqGXmKD0twQbxrqdKKq2khemLj9jw6ySj3Oq7Xh24nM9AJokBvhEDHhMTR
         4tePYgfwyfjVmRv9jVhQRE1/iIg3MykD9tIpb6r8r8dGkayWNufwozBzGeHXn4wCCA
         eDU4qFmgpjM50HGZjNKilGYAT6hhk/x9xF0bk2rE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00VGgK1E069773;
        Fri, 31 Jan 2020 10:42:20 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 31
 Jan 2020 10:42:19 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 31 Jan 2020 10:42:19 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00VGgJTF016761;
        Fri, 31 Jan 2020 10:42:19 -0600
Subject: Re: How to synchronize leds in trigger
To:     Marek Behun <marek.behun@nic.cz>, Oleh Kravchenko <oleg@kaa.org.ua>
CC:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        <linux-leds@vger.kernel.org>
References: <69050f67-b611-dfd9-b166-a0d51edc18e2@kaa.org.ua>
 <d44bcd3c-bc6f-9168-bfbd-c71469d5e771@gmail.com>
 <54c07894-f302-fe1e-9f03-aa30ea1abca1@kaa.org.ua>
 <20200130104424.22cec119@nic.cz>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <4711aef2-d608-b0fe-f36a-80702753f10d@ti.com>
Date:   Fri, 31 Jan 2020 10:39:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200130104424.22cec119@nic.cz>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Marek

On 1/30/20 3:44 AM, Marek Behun wrote:
> On Thu, 30 Jan 2020 09:57:08 +0200
> Oleh Kravchenko <oleg@kaa.org.ua> wrote:
>
>> I'm happy to invest my time to implement such functionality.
>> I think it can be really useful for LEDs array like CR0014114 <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.5&id=b9dd69155371ebd7055c182e30423edc9104239f>.
>>
>> In few days I can publish my vision,
>> but before that could you please explain why it will took months?
>> Where it can be hard to implement?
>>
> Just look at how long the API for RGB LEDs is being agreed upon. It is
> over a year already, if not longer, and still not merged.

Agreed. The patchset for RGB LEDs has been waiting since November for 
merge or even applied to led-next.  I rebased the patches and added the 
ACKs and resent.  Kinda hoped it would have made 5.6.

Dan

