Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3021426DAC8
	for <lists+linux-leds@lfdr.de>; Thu, 17 Sep 2020 13:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbgIQLxY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 07:53:24 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:38626 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726931AbgIQLwj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Sep 2020 07:52:39 -0400
X-Greylist: delayed 725 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 07:52:33 EDT
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08HBdv2V031631;
        Thu, 17 Sep 2020 06:39:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1600342797;
        bh=ESvWwoFDYMl5ytgv/ddu5UJU62Q1FWPpRf5Vn+o0kDk=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=gFhLV/WzhLpbkm0gXjKDMW+M/gbwSobzAdFRyXoX/iWoN33JGqVqk9z8YogtvJgPD
         P0n53e4MwZnXr1Tw7nAkChoFU2NNUVZjokzhckCO6GsfSvsJVBzm90taQXvz16bE7n
         yUt8tmoKd0xyKLoe4EtI8hiVau0ozNOzaX9wHS7I=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08HBdvHO086533
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 17 Sep 2020 06:39:57 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Sep 2020 06:39:57 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Sep 2020 06:39:57 -0500
Received: from [10.250.32.129] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08HBduot130085;
        Thu, 17 Sep 2020 06:39:56 -0500
Subject: Re: [PATCH leds v1 03/10] leds: lm3697: use struct led_init_data when
 registering
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        <linux-leds@vger.kernel.org>
CC:     Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megous@megous.com>,
        <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
References: <20200916231650.11484-1-marek.behun@nic.cz>
 <20200916231650.11484-4-marek.behun@nic.cz>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <a8db8039-3ce3-2669-4287-04585fcc17a1@ti.com>
Date:   Thu, 17 Sep 2020 06:39:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200916231650.11484-4-marek.behun@nic.cz>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Marek

On 9/16/20 6:16 PM, Marek Behún wrote:
> By using struct led_init_data when registering we do not need to parse
> `label` DT property nor `linux,default-trigger` property.

I would prefer 2 separate patches. One implementing the init_data and 
the other removing the default trigger

Dan


