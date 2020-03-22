Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E150B18E988
	for <lists+linux-leds@lfdr.de>; Sun, 22 Mar 2020 16:11:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgCVPLc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 22 Mar 2020 11:11:32 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46966 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbgCVPLc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 22 Mar 2020 11:11:32 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02MFBT1w042092;
        Sun, 22 Mar 2020 10:11:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584889889;
        bh=aryxxubikk57kH2MSroGkL13+y8fp1XqKjPuzTxehPo=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=l8vYdx0KQaOGDW1jVW9Je5evHQ6UnPvGiy0jDHWZhPwqnvUhBDwgYnDh62ZSCZaPJ
         Y+QPCoKR8mef97J/fI8I0xWlzenLvEw5KyxjxvLy5sRsmQZfc+JUJPJQGzWUAbmbMI
         oDWoZJD43DDQUp9Y2hdryrkVFq5AYkFWMs6lH1u4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02MFBTEj130866;
        Sun, 22 Mar 2020 10:11:29 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sun, 22
 Mar 2020 10:11:28 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sun, 22 Mar 2020 10:11:28 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02MFBSpp031694;
        Sun, 22 Mar 2020 10:11:28 -0500
Subject: Re: Cleanups in "next" tree
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, <linux-leds@vger.kernel.org>
References: <20200322115906.GA10623@duo.ucw.cz>
 <3a103317-b9fb-5d0f-6944-0114b9af1629@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <0b6dfd3c-b5a4-a241-dfc6-f2fd24680dc0@ti.com>
Date:   Sun, 22 Mar 2020 10:05:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <3a103317-b9fb-5d0f-6944-0114b9af1629@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Pavel

On 3/22/20 8:35 AM, Jacek Anaszewski wrote:
> Hi Pavel,
>
> On 3/22/20 12:59 PM, Pavel Machek wrote:
>> Hi!
>>
>> I've commited some cleanups into LED tree ( git/pavel/linux-leds.git
>> branch for-next ), if someone wants to review them.
> You abused your maintainer power by bypassing the usual patch
> submission procedure. Please remove the patches from linux-next
> and submit them officially for discussion. I would have some objections
> to them.
>
I had a comment on one of the patches and wanted to add my RB.

So can you please post them?

Dan

