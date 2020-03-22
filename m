Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6FA18E9E7
	for <lists+linux-leds@lfdr.de>; Sun, 22 Mar 2020 16:56:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbgCVP4a (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 22 Mar 2020 11:56:30 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:45456 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbgCVP4a (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 22 Mar 2020 11:56:30 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02MFuILH027029;
        Sun, 22 Mar 2020 10:56:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584892578;
        bh=krvSvCp4c3Z1zXot1CQc/uiYvmQjawtTqp0lfTNZk18=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=T+5PHrWaS84W3bB0chhjzmK35XezSDkob5ozoA6+cOqE/rqqogzpd+tKB70DDben2
         4DHjIcwA4ZNqNFbZmu8OGMhvAMI+H53P6WaZBP/1GmNJD2VdtRfKP4jRNaVCzVG1Kb
         OqFap1y03AK68P89Bzik92JpGiW9hWu6CFfJMCcA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02MFuIZB096920
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 22 Mar 2020 10:56:18 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sun, 22
 Mar 2020 10:56:17 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sun, 22 Mar 2020 10:56:18 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02MFuHn0046658;
        Sun, 22 Mar 2020 10:56:17 -0500
Subject: Re: [PATCH RFC leds-next] leds: initial support for Turris Omnia LEDs
To:     Marek Behun <marek.behun@nic.cz>, Pavel Machek <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
References: <20200319181604.2425-1-marek.behun@nic.cz>
 <20200321225342.7651547b@nic.cz> <20200321221653.GA13329@amd>
 <20200321233638.587d94cc@nic.cz>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <c3d33dab-e3b5-895d-7f50-f6370369677a@ti.com>
Date:   Sun, 22 Mar 2020 10:50:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200321233638.587d94cc@nic.cz>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Marek

On 3/21/20 5:36 PM, Marek Behun wrote:
> On Sat, 21 Mar 2020 23:16:53 +0100
> Pavel Machek <pavel@ucw.cz> wrote:
>
>> Hi!
>>
>>> The microcontroller on Turris Omnia supports more settings than just
>>> LEDs (usb3 port power and input button for example).
>>>
>>> I am wondering if this approach (registering LED driver to
>>> communicate with the microcontroller) is correct, since the
>>> microcontroller can do other things.
>>>
>>> For Turris Mox firmware I created a driver in
>>> drivers/firmware/turris-mox-rwtm.c.
>> this should be drivers/platform/turris/, I believe. It is not
>> _firmware_, is it?
>>
> It is code that interacts with the firmware. It already is merged in
> drivers/firmware/. The raspberrypi firmware interacting drivers is also
> there...


Would a MFD driver be better here?

Dan

