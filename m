Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78601134B5A
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jan 2020 20:15:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727103AbgAHTPX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 8 Jan 2020 14:15:23 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59240 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730293AbgAHTPX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 8 Jan 2020 14:15:23 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 008JFIpF022294;
        Wed, 8 Jan 2020 13:15:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578510918;
        bh=GADxs8iuDDp1e7HSjq06LFbU5gQ44F5odDANmb4L5n4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=X7Rm0hzJ4cnLhLHnLadpg1GpH6CYa/NMaIJVfiahZDSiTNo58MAzVdz1MRiYvrYj4
         6u5ORmpcFkHl9e2+Xh88CdmLraeKmyjrvGQXDo4xqyvqrlr76e6njQlMt9qQQ6xSU1
         YEwWexAJA4McPuBC2TntNxjFcLRYTTzxq+jdI+ng=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 008JFIec097542
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 8 Jan 2020 13:15:18 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 8 Jan
 2020 13:15:18 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 8 Jan 2020 13:15:17 -0600
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 008JFHYa028176;
        Wed, 8 Jan 2020 13:15:17 -0600
Subject: Re: [PATCH v17 00/19] Multicolor Framework
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20191114133023.32185-1-dmurphy@ti.com>
 <efdfcf1f-50b2-314f-3d46-93369229109a@ti.com>
 <63fd7446-d051-5ef2-3901-dbc290b158e0@ti.com>
 <ad01049a-e166-9740-13ae-1ee91079c2fd@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <5e249d4a-cfe6-3b21-ad86-e5a32fc6cd64@ti.com>
Date:   Wed, 8 Jan 2020 13:12:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <ad01049a-e166-9740-13ae-1ee91079c2fd@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 1/8/20 1:09 PM, Jacek Anaszewski wrote:
> On 1/8/20 2:48 PM, Dan Murphy wrote:
>> Hello
>>
>> Do you have a time frame in applying this patch set?
> I am afraid we're not waiting just for applying but for Pavel's
> opinion on the most crucial parts of this patch set...

OK.  The patchset is aging rapidly as it is almost 2 months old.

Dan

