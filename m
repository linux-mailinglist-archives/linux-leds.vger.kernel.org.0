Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEB67274582
	for <lists+linux-leds@lfdr.de>; Tue, 22 Sep 2020 17:39:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgIVPju (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Sep 2020 11:39:50 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48768 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbgIVPjs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Sep 2020 11:39:48 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08MFdZ0x124882;
        Tue, 22 Sep 2020 10:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1600789175;
        bh=Lm3q++uDY+gEpOeA5Qh4BLf1y6REKLm6A/cSKCVwLJg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=hrQ1UDWMJwzGYbw+3sJLIe6taKnxTDG+g0TeijZO73zM+F3wTAQSLi9gfBj90OzKi
         DZld2XEFb7IkckVGEl5L/br02J33bz2uDYvn63+Y9U/QDoA+y6eXCBamejn0A7TrLX
         LYXSFiDpQDSzpn9AWVzCYvEEscP/ZxSJQ74cTXTU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08MFdZeD079762
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 22 Sep 2020 10:39:35 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 22
 Sep 2020 10:39:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 22 Sep 2020 10:39:35 -0500
Received: from [10.250.71.177] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08MFdYJ9056382;
        Tue, 22 Sep 2020 10:39:34 -0500
Subject: Re: [PATCH leds v3 1/9] leds: lm36274: cosmetic: rename lm36274_data
 to chip
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        <linux-leds@vger.kernel.org>
CC:     Pavel Machek <pavel@ucw.cz>
References: <20200919180304.2885-1-marek.behun@nic.cz>
 <20200919180304.2885-2-marek.behun@nic.cz>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <a5e6ff92-ebe9-f977-f5eb-21447fc6016a@ti.com>
Date:   Tue, 22 Sep 2020 10:39:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200919180304.2885-2-marek.behun@nic.cz>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Marek

On 9/19/20 1:02 PM, Marek Behún wrote:
> Rename this variable so that it is easier to read and easier to write in
> 80 columns. Also rename variable of this type in lm36274_brightness_set
> from led to chip, to be consistent.

This patch seems a bit unnecessary.  The current variables fit fine with 
80 columns.

Dan


