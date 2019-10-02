Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B939C8D3A
	for <lists+linux-leds@lfdr.de>; Wed,  2 Oct 2019 17:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbfJBPq1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Oct 2019 11:46:27 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:56298 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbfJBPq1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Oct 2019 11:46:27 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92FkLb9129661;
        Wed, 2 Oct 2019 10:46:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570031181;
        bh=YVeTV9cmDVrXESTQYp7X2KJW0tWZijQIkQxHlYFki2o=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=tmLUteC6HXcSIkaaWWDJ29NpTMJeUbiE66E3XT+x0vSt7UdrHYDhNLw5sQ4P07iSR
         aIvXeywvYbAEUEODufwO5//U+PfaaoXfIhglrwJKQL4SzOYimzh3ZW1dfvPUUMQrjt
         yyELwaoeW4ItcH5gvTBe5h/vdPQVHqZfRL75KfgE=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92FkLII107830;
        Wed, 2 Oct 2019 10:46:21 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 2 Oct
 2019 10:46:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 2 Oct 2019 10:46:21 -0500
Received: from [10.250.65.13] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92FkKgo039310;
        Wed, 2 Oct 2019 10:46:20 -0500
Subject: Re: [PATCH -next 2/2] leds: add /sys/class/leds/<led>/current-trigger
To:     Akinobu Mita <akinobu.mita@gmail.com>,
        <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
References: <1570029181-11102-1-git-send-email-akinobu.mita@gmail.com>
 <1570029181-11102-3-git-send-email-akinobu.mita@gmail.com>
From:   Dan Murphy <dmurphy@ti.com>
Message-ID: <ec4d9d2c-6f8d-97a6-41d7-832a3fc1ca72@ti.com>
Date:   Wed, 2 Oct 2019 10:47:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1570029181-11102-3-git-send-email-akinobu.mita@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Akinobu

On 10/2/19 10:13 AM, Akinobu Mita wrote:
> Reading /sys/class/leds/<led>/trigger returns all available LED triggers.
> However, this violates the "one value per file" rule of sysfs.
>
> This provides /sys/class/leds/<led>/current-trigger which is almost
> identical to /sys/class/leds/<led>/trigger.  The only difference is that
> 'current-trigger' only shows the current trigger name.
>
> This new file follows the "one value per file" rule of sysfs.
> We can find all available LED triggers by listing the
> /sys/devices/virtual/led-trigger/ directory.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Dan Murphy <dmurphy@ti.com>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> ---
>   Documentation/ABI/testing/sysfs-class-led | 13 +++++++++++
>   drivers/leds/led-class.c                  | 10 ++++++++
>   drivers/leds/led-triggers.c               | 38 +++++++++++++++++++++++++++----
>   drivers/leds/leds.h                       |  5 ++++
>   4 files changed, 62 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
> index 5f67f7a..fdfed3f 100644
> --- a/Documentation/ABI/testing/sysfs-class-led
> +++ b/Documentation/ABI/testing/sysfs-class-led
> @@ -61,3 +61,16 @@ Description:
>   		gpio and backlight triggers. In case of the backlight trigger,
>   		it is useful when driving a LED which is intended to indicate
>   		a device in a standby like state.
> +
> +What:		/sys/class/leds/<led>/current-trigger
> +Date:		September 2019
> +KernelVersion:	5.5
> +Contact:	linux-leds@vger.kernel.org
> +Description:
> +		Set the trigger for this LED. A trigger is a kernel based source
> +		of LED events.
> +		Writing the trigger name to this file will change the current
> +		trigger. Trigger specific parameters can appear in
> +		/sys/class/leds/<led> once a given trigger is selected. For
> +		their documentation see sysfs-class-led-trigger-*.
> +		Reading this file will return the current LED trigger name.

Why do we need this new file can't we just update the current trigger 
file implementation?

I don't see any documentation that states that the read of the trigger 
file will print a list of known triggers.

And writing to the trigger file still works so I would think the _show 
just needs to be fixed.

Besides this patch does not fix the issue in the commit message that the 
trigger file still violates the one value per file rule.

Dan

