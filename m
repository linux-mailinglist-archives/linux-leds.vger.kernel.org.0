Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A84CF28380A
	for <lists+linux-leds@lfdr.de>; Mon,  5 Oct 2020 16:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgJEOmA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 5 Oct 2020 10:42:00 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44812 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbgJEOl7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 5 Oct 2020 10:41:59 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 095EfJoK107006;
        Mon, 5 Oct 2020 09:41:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1601908879;
        bh=F2fRX3F6phFrNzXyEO5ny8eJjv4EnilGQEx3qSo1EYA=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=u7RAyaTFMVOMPDuG4pThU3VF9HyHIiDH+8qFYw9HnWTAVHq/1vqjfTzMYyrX4Vcv7
         AcyKS7LW3VZcHb0nNU8BVgA59C04FAp6pE3QUcKmMzO3lloroRKp9JreSEjQO9VueI
         BBpZv4qknhXwikkIR1iFTwRI8xoZHnrqt+qeheOM=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 095EfJQX092644
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 5 Oct 2020 09:41:19 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 5 Oct
 2020 09:41:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 5 Oct 2020 09:41:19 -0500
Received: from [10.250.71.177] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 095EfHYV099554;
        Mon, 5 Oct 2020 09:41:17 -0500
Subject: Re: [PATCH] leds: lm3697: Fix out-of-bound access
To:     <ultracoolguy@tutanota.com>
CC:     Marek Behun <kabel@blackhole.sk>, Pavel <pavel@ucw.cz>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Linux Leds <linux-leds@vger.kernel.org>
References: <MIiYgay--3-2@tutanota.com> <20201005141334.36d9441a@blackhole.sk>
 <MIt2NiS--3-2@tutanota.com> <3c5fce56-8604-a7d5-1017-8a075f67061e@ti.com>
 <MItBqjy--3-2@tutanota.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <966c3f39-1310-dd60-6f33-0d9464ed2ff1@ti.com>
Date:   Mon, 5 Oct 2020 09:41:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <MItBqjy--3-2@tutanota.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Gabriel

On 10/5/20 9:38 AM, ultracoolguy@tutanota.com wrote:
> I understand. So I should leave it like it was and do the rename in another patch?

You should do the fix in one patch and leave the structure name alone.

The structure naming if fine and has no benefit and actually will make 
it more difficult for others to backport future fixes.

Unless Pavel finds benefit in accepting the structure rename.

Dan

