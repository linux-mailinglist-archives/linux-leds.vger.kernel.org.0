Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F081E1BAB01
	for <lists+linux-leds@lfdr.de>; Mon, 27 Apr 2020 19:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbgD0RSy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Apr 2020 13:18:54 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:33570 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbgD0RSy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Apr 2020 13:18:54 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03RHIpiW064232;
        Mon, 27 Apr 2020 12:18:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588007931;
        bh=Ua86GDqoUOR9cTYmT2KqUary2XbhydeTyCobYIklqVA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=VYhIcg4xSZUDVJMb3PL7tgOjww0bS9ooUwZYfrd9eQNv4sz9Dkcf5OlAv4nhEqFyt
         NhgQR2TkjVL6d2nOocQFUZpNWZBuKsehRHeI94J47be5+ur24MfQAAUEew6TnecHB4
         ZYsCVgb1Rh1EItWpsWALBNL5BOJ4c01B2wuZG3Sk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03RHIoiE089751
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Apr 2020 12:18:50 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 27
 Apr 2020 12:18:50 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 27 Apr 2020 12:18:50 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03RHIoR7059853;
        Mon, 27 Apr 2020 12:18:50 -0500
Subject: Re: [PATCH v20 03/17] leds: multicolor: Introduce a multicolor class
 definition
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200423155524.13971-1-dmurphy@ti.com>
 <20200423155524.13971-4-dmurphy@ti.com> <20200425195328.GB1143@bug>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <53ee79e9-fe77-85a8-3b40-90fe78cd2680@ti.com>
Date:   Mon, 27 Apr 2020 12:12:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200425195328.GB1143@bug>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 4/25/20 2:53 PM, Pavel Machek wrote:
> Hi!
>
>> Introduce a multicolor class that groups colored LEDs
>> within a LED node.
>>
>> The multi color class groups monochrome LEDs and allows controlling two
>> aspects of the final combined color: hue and lightness. The former is
>> controlled via color_intensity file and the latter is controlled
>> via brightness file.
> It is now multi_intensity, AFAICT.
> 						
Ack
> 			Pavel
