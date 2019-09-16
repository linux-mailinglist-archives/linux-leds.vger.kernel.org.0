Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5770B3BF1
	for <lists+linux-leds@lfdr.de>; Mon, 16 Sep 2019 15:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388196AbfIPN4p (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Sep 2019 09:56:45 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:33430 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387994AbfIPN4p (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 16 Sep 2019 09:56:45 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8GDufEq034297;
        Mon, 16 Sep 2019 08:56:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568642201;
        bh=0gcT6rF9/y6ZRRp8KTYYKr6BbpmQjq19ySJfBPIhBZo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=F8FSYBCXaUypv/jxgCv3SRDgAEgwmwop/tuYNRn5mPZPv/szRMR5THhiw7+qt1rMj
         6vPIDAjweSHKoBC6DT4h2ummlUtZFWxat4Hg2FV34U9jVVp9tQcd5MPidTTiKWn3Pc
         zG/yUiJHOQWyW0yuUR0JSdTdthpIsQjI+yDfWzzQ=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8GDufrV077214
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Sep 2019 08:56:41 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 16
 Sep 2019 08:56:40 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 16 Sep 2019 08:56:38 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8GDueNP023557;
        Mon, 16 Sep 2019 08:56:40 -0500
Subject: Re: [PATCH v5 3/9] dt: bindings: Add multicolor class dt bindings
 documention
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>
CC:     <robh+dt@kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20190911180115.21035-1-dmurphy@ti.com>
 <20190911180115.21035-4-dmurphy@ti.com>
 <e842eef7-094a-a7dd-bcf1-90ed41bf45cd@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <0018201c-4e31-f3c4-13bf-a22536b12f1c@ti.com>
Date:   Mon, 16 Sep 2019 08:58:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e842eef7-094a-a7dd-bcf1-90ed41bf45cd@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello

On 9/15/19 9:01 AM, Jacek Anaszewski wrote:
> Dan,
>
> This patch has the same issues I mentioned in the v4 review [0].

Sorry for that with all the rework done to this again the changes may 
have been lost.

I will update per v4 comments

Dan


> https://lore.kernel.org/linux-leds/684010e7-a47c-2bc8-2bf6-c632be31649b@gmail.com/
>
