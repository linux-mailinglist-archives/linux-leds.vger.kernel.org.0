Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92A11DEB4E
	for <lists+linux-leds@lfdr.de>; Mon, 21 Oct 2019 13:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728213AbfJULrD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Oct 2019 07:47:03 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:37098 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727725AbfJULrD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Oct 2019 07:47:03 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9LBkrqa034784;
        Mon, 21 Oct 2019 06:46:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571658413;
        bh=9685NJF42uQRzMwQYkhd+6NMjtGXi7wyw8hXK7A5sFg=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Jp2DwO4U5DiK3uJQXY+srkRDqTKBdwJz9HDQgBfjwz3yk6qOfMtdqqqGJ2IcEWvzF
         pP/TPaFhjcjgBwwDRhimS1/i4/A1QmISq/AWk74mgQrRsNrtsMQohtxt8mUeHEb3WT
         5IUMt6Wf4O85J/ZTrcQ13qjTZM5I3bQBrVeEbA+k=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9LBkrxP121917
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 21 Oct 2019 06:46:53 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 21
 Oct 2019 06:46:43 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 21 Oct 2019 06:46:43 -0500
Received: from [10.250.35.43] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9LBkq8p031649;
        Mon, 21 Oct 2019 06:46:52 -0500
Subject: Re: [PATCH v12 06/16] leds: lp50xx: Add the LP50XX family of the RGB
 LED driver
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
CC:     <pavel@ucw.cz>, <linux-leds@vger.kernel.org>
References: <20191011130657.4713-7-dmurphy@ti.com>
 <201910141723.wxRNtgEe%lkp@intel.com>
 <b71aa86c-515d-2ad3-2d1b-da312d9b3f1f@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <32f384d7-8d2e-889e-c40d-e6370c73be26@ti.com>
Date:   Mon, 21 Oct 2019 06:46:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b71aa86c-515d-2ad3-2d1b-da312d9b3f1f@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Jacek

On 10/19/19 12:13 PM, Jacek Anaszewski wrote:
> Dan,
>
> Below compilation errors are occurring also for v14.
> Did you compile-test it at least?

Compile tested and board tested.

Dan


