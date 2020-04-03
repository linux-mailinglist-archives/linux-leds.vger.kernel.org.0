Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1751E19DE6B
	for <lists+linux-leds@lfdr.de>; Fri,  3 Apr 2020 21:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728572AbgDCTNt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Apr 2020 15:13:49 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:59420 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728352AbgDCTNs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Apr 2020 15:13:48 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 033JDiG1034910;
        Fri, 3 Apr 2020 14:13:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585941224;
        bh=opefHXpRY+yQD0H5nfaeAPuvZRCgMSVglcVu8kVV+ME=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ZbaNyU8sTbEkEd20NtLBRw6ojyXCH1NUfIRCyD0ojVUhrdK4+NST8GGdyzozm7MOu
         18sGQZ1pyNJGxibJmyFd4rx2m2T5XY2yrUkDYbehvvgg+j8QU5dJDx0PNFT81L7rwA
         m9yFUfekFynapVtf7Fj+tIHuDFVPshg7NtpNStTE=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 033JDi3D067843
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 3 Apr 2020 14:13:44 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 3 Apr
 2020 14:13:44 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 3 Apr 2020 14:13:44 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 033JDh3X126629;
        Fri, 3 Apr 2020 14:13:44 -0500
Subject: Re: Cleanups in "next" tree
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
References: <20200322115906.GA10623@duo.ucw.cz>
 <3a103317-b9fb-5d0f-6944-0114b9af1629@gmail.com> <20200402225745.GA9830@amd>
 <a4802e70-106b-3476-536f-1d8798ce156f@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <82de0f5e-2382-e2ae-ec70-392cc95502fc@ti.com>
Date:   Fri, 3 Apr 2020 14:07:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <a4802e70-106b-3476-536f-1d8798ce156f@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 4/3/20 1:45 PM, Jacek Anaszewski wrote:
> On 4/3/20 12:57 AM, Pavel Machek wrote:
>> On Sun 2020-03-22 14:35:56, Jacek Anaszewski wrote:
>>> Hi Pavel,
>>>
>>> On 3/22/20 12:59 PM, Pavel Machek wrote:
>>>> Hi!
>>>>
>>>> I've commited some cleanups into LED tree ( git/pavel/linux-leds.git
>>>> branch for-next ), if someone wants to review them.
>>> You abused your maintainer power by bypassing the usual patch
>>> submission procedure. Please remove the patches from linux-next
>>> and submit them officially for discussion. I would have some objections
>>> to them.
>> I'm sorry I failed to meet your high expectations... But I don't
>> believe I done anything completely outside of usual kernel procedures.
> I believe code review is quite usual kernel procedure.
>
>> Could you list the patches and objections you have?
> I already expressed my concerns regarding Turris Omnia patch.
>
> My comments regarding remaining patches:
>
> - "Make label "white:power" to be consistent with"
>
> I disagree here. "system" was OK.
>
> - "Warn about old defines that probably should not be used."
>
> Obsolete is only LED_FULL, so the comment is in wrong line

I would prefer to have the commit sha that obsoleted the LED_FULL to be 
referenced in the commit message so we have traceability.

Dan
