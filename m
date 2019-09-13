Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC1DB2145
	for <lists+linux-leds@lfdr.de>; Fri, 13 Sep 2019 15:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390313AbfIMNlz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 13 Sep 2019 09:41:55 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:39828 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390169AbfIMNly (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 13 Sep 2019 09:41:54 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8DDfoaf094202;
        Fri, 13 Sep 2019 08:41:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568382110;
        bh=z1V+v3q+InJeoYcLZ06aHyRBUiufpJvPRs8v6Mio0c8=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=ZBykWoc9JqVk3Kervj6A7s8CfmqgeF3d6/CP5ARCQAsKjoJa4Vwu7s5Nwy+nIVMer
         9OUlm8kjyPUuAW8NgEFd34gEjzLk//iY2SXvsm4TZusx3eKz65fhRXVMLW9N9DswNL
         5f1UE5xVzcsbXk8nqbZwgKfvXsKw9qKBsBQ+UdcE=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8DDfoS7021604
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 13 Sep 2019 08:41:50 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 13
 Sep 2019 08:41:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 13 Sep 2019 08:41:49 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8DDfnlY014551;
        Fri, 13 Sep 2019 08:41:49 -0500
Subject: Re: [PATCH v8 2/2] leds: add LED driver for EL15203000 board
To:     Oleh Kravchenko <oleg@kaa.org.ua>, <devicetree@vger.kernel.org>,
        <linux-leds@vger.kernel.org>, <jacek.anaszewski@gmail.com>,
        <pavel@ucw.cz>
References: <20190912221115.23595-1-oleg@kaa.org.ua>
 <20190912221115.23595-3-oleg@kaa.org.ua>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <ffae7af2-29f7-0d49-a77d-63c1ad3d27b3@ti.com>
Date:   Fri, 13 Sep 2019 08:42:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912221115.23595-3-oleg@kaa.org.ua>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Oleh

On 9/12/19 5:11 PM, Oleh Kravchenko wrote:
> This patch adds a LED class driver for the LEDs found on
> the Crane Merchandising System EL15203000 LEDs board
> (aka RED LEDs board).
>
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>

Reviewed-by: Dan Murphy <dmurphy@ti.com>

