Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA2921FA19E
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jun 2020 22:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731583AbgFOUb7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Jun 2020 16:31:59 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53732 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728346AbgFOUbX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Jun 2020 16:31:23 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05FKVIrP098992;
        Mon, 15 Jun 2020 15:31:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1592253078;
        bh=O7jkcz4ZeSjHhyhXjefbDQx00ANrTeDJE4DwrKvT2cQ=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=v1P4IOimcJS9ym8uO9nJDeATWPXCLwcEB5NkKzWWrjIJHv8KfPM7TvsgKhQQGasKO
         aZjDtjf7S9zuRjIqrfDcsTKqTY2d5X6OQHUZ96dm4s7UCFXydzs1krFE1Sfqwq6r03
         2m5X30U/4NfmeqZa49YRk4soAzXIsHyJK74VHaBc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05FKVIt5068327;
        Mon, 15 Jun 2020 15:31:18 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 15
 Jun 2020 15:31:18 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 15 Jun 2020 15:31:18 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05FKVIfr021151;
        Mon, 15 Jun 2020 15:31:18 -0500
Subject: Re: [RESEND PATCH v27 00/15] Multicolor Framework v27
To:     Pavel Machek <pavel@ucw.cz>
CC:     <jacek.anaszewski@gmail.com>, <robh@kernel.org>,
        <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200615201522.19677-1-dmurphy@ti.com>
 <20200615202731.GA18028@duo.ucw.cz>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <55a4f116-30fd-b1b1-3ba3-188e1833c4e4@ti.com>
Date:   Mon, 15 Jun 2020 15:31:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200615202731.GA18028@duo.ucw.cz>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 6/15/20 3:27 PM, Pavel Machek wrote:
> Hi!
>
>> This is the multi color LED framework.   This framework presents clustered
>> colored LEDs into an array and allows the user space to adjust the brightness
>> of the cluster using a single file write.  The individual colored LEDs
>> intensities are controlled via a single file that is an array of
>> LEDs
> Please don't do this. Pinging whoever you think is blocking the merge
> is okay, but resending big series just because people are busy over
> the merge window is not cool.

Actually that is not the case.  I missed adding Rob H to the series so I 
resent the patches to add Rob in.

There was no intent to resend because I thought it was blocked.

I know we are in a merge window and thoroughly understand that ppl are busy.

If I thought it was blocked I would have just bumped the first patch.

Dan


> Thanks,
>
> 								Pavel
