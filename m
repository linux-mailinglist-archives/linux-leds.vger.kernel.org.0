Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6970924786B
	for <lists+linux-leds@lfdr.de>; Mon, 17 Aug 2020 23:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbgHQVAE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 Aug 2020 17:00:04 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47772 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgHQVAE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 Aug 2020 17:00:04 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07HKxlrv041340;
        Mon, 17 Aug 2020 15:59:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1597697987;
        bh=iPwtdiZ9M530IgYsmj2NfHt1KBrq4LqlIipS6kK6gvI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=zRkKo65XaDnGTtWtXBWKgoAbWO5sbdGTs98nwTO6egAb+DlqKLJVhYiiKX6VN49YF
         L7vJ0qKnwevSx8VAit0JYJ3IiNfFQAKxoE8MQ+S6yiLHyGXC8oEE6BISDqXdV1tbbm
         kcNrSl0ZwZ4UVQkYXRe2krDcbjbw9ODJKgiXZ+yU=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07HKxldj055398
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 17 Aug 2020 15:59:47 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 17
 Aug 2020 15:59:46 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 17 Aug 2020 15:59:46 -0500
Received: from [10.250.38.37] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07HKxkKs128910;
        Mon, 17 Aug 2020 15:59:46 -0500
Subject: Re: [PATCH v33 0/6] LP50xx addition and remainder Multicolor patches
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <robh@kernel.org>,
        <marek.behun@nic.cz>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20200812195020.13568-1-dmurphy@ti.com>
 <20200817203519.GA14622@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <e8f53aea-2f33-e186-d74c-da1b94974511@ti.com>
Date:   Mon, 17 Aug 2020 15:59:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817203519.GA14622@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 8/17/20 3:35 PM, Pavel Machek wrote:
> Hi!
>
>> These are the final patches from the original multicolor framework patchset.
>>
>> Changes made were to the LP50xx to rework regmap_defaults to eliminate used
>> only once #defines.  Also fixed putting the child node in the dt parsing and
>> changed regmap regcache type to flat.
> Thanks. I applied 1 and 2 of the series to the for-next branch.

Thanks.  The DT files are not really a major issue.  But the defconfig 
is not sure who to ping to have them pull it.

Maybe Linus W?

Dan

> Best regards,
> 								Pavel
