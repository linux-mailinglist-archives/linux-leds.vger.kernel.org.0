Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8CFC261F12
	for <lists+linux-leds@lfdr.de>; Tue,  8 Sep 2020 21:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730475AbgIHT6m (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 8 Sep 2020 15:58:42 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47486 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730176AbgIHPfm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 8 Sep 2020 11:35:42 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 088EEO62040774;
        Tue, 8 Sep 2020 09:14:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1599574464;
        bh=362EVhcP1ExwtmVZiQkIb5x6Yg4rPvLgH1gDwH3m8P4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=kIRfaUoIMVEntv78JAUsTIXtMMJEhxv7cGcQV8JdKjfYyvxEslm6+klfuWWV8PCji
         zXvd7SD3ie+BbiWV0LoSzILEcIvwQ7D/nhiJMtSZDoxYy7eL5A09dUrxLA0zSTK9Yx
         71o1uqiBsnwjDYle0QVuf2+aBoI6F3mZmWhdjAOs=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 088EEOLZ045543
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Sep 2020 09:14:24 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Sep
 2020 09:14:24 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Sep 2020 09:14:24 -0500
Received: from [10.250.38.37] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 088EEOFG106227;
        Tue, 8 Sep 2020 09:14:24 -0500
Subject: Re: [PATCH v3 0/2] leds: mt6360: Add LED driver for MT6360
To:     Gene Chen <gene.chen.richtek@gmail.com>,
        <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <matthias.bgg@gmail.com>
CC:     <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <gene_chen@richtek.com>,
        <Wilma.Wu@mediatek.com>, <shufan_lee@richtek.com>,
        <cy_huang@richtek.com>, <benjamin.chao@mediatek.com>
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <b8d090b7-ef47-d434-1af1-2afbc2ad30ae@ti.com>
Date:   Tue, 8 Sep 2020 09:14:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Gene

On 9/7/20 5:27 AM, Gene Chen wrote:
> In-Reply-To:
>
> This patch series add MT6360 LED support contains driver and binding document

I cannot find the v2 patch series for this.

Dan

