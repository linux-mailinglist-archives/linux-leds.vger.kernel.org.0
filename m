Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 853EB19D6FC
	for <lists+linux-leds@lfdr.de>; Fri,  3 Apr 2020 14:55:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgDCMzi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 3 Apr 2020 08:55:38 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:57000 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727882AbgDCMzi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 3 Apr 2020 08:55:38 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 033CtXOT078628;
        Fri, 3 Apr 2020 07:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1585918534;
        bh=zHg91WiJBWz2Fi4pC1UUIQ2mI/iVfDn7kpR8RVMHrdw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=pnTh+wiwdnusKx/s6QDDG63eOAeCqPJeWl/5E7XuR7RX5Ozu2TtDuTeJyYUN6KK1m
         v7v6wNjS5PJgqKOKlWP547q3VIXRiMv/78F3mvjLMaVsJgrmaJFjMKpySL3ylnD73t
         7W6hSUX04UajaPNAZVJ6CvRLZVyDZxtcaaHpnDpM=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 033CtXhs120281
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 3 Apr 2020 07:55:33 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 3 Apr
 2020 07:55:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 3 Apr 2020 07:55:33 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 033CtXfd095739;
        Fri, 3 Apr 2020 07:55:33 -0500
Subject: Re: Cleanups in "next" tree
To:     Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>
CC:     <linux-leds@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
References: <20200322115906.GA10623@duo.ucw.cz>
 <3a103317-b9fb-5d0f-6944-0114b9af1629@gmail.com> <20200402225745.GA9830@amd>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <7cce20f9-f665-2b96-2657-e489df87dd3f@ti.com>
Date:   Fri, 3 Apr 2020 07:49:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200402225745.GA9830@amd>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 4/2/20 5:57 PM, Pavel Machek wrote:
> On Sun 2020-03-22 14:35:56, Jacek Anaszewski wrote:
>> Hi Pavel,
>>
>> On 3/22/20 12:59 PM, Pavel Machek wrote:
>>> Hi!
>>>
>>> I've commited some cleanups into LED tree ( git/pavel/linux-leds.git
>>> branch for-next ), if someone wants to review them.
>> You abused your maintainer power by bypassing the usual patch
>> submission procedure. Please remove the patches from linux-next
>> and submit them officially for discussion. I would have some objections
>> to them.
> I'm sorry I failed to meet your high expectations... But I don't
> believe I done anything completely outside of usual kernel procedures.

So I can push a public tree out and request reviewers to review that 
tree and expect it to get merged once the review is complete without 
ever posting the patches to linux-leds?

This would be the precedent you are setting here as maintainer.

And Jacek does not have high expectations he is just requesting that we 
follow the process as defined in the Linux kernel document

Dan


