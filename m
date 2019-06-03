Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 906D933511
	for <lists+linux-leds@lfdr.de>; Mon,  3 Jun 2019 18:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbfFCQgE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 3 Jun 2019 12:36:04 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35154 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfFCQgE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 3 Jun 2019 12:36:04 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id BABD02603CB
Subject: Re: [PATCH v6] platform/chrome: Add Wilco EC keyboard backlight LEDs
 support
To:     Pavel Machek <pavel@ucw.cz>, Nick Crews <ncrews@chromium.org>
Cc:     bleung@chromium.org, linux-leds@vger.kernel.org,
        jacek.anaszewski@gmail.com, linux-kernel@vger.kernel.org,
        dlaurie@chromium.org, sjg@google.com, groeck@google.com,
        dtor@google.com
References: <20190409001642.249197-1-ncrews@chromium.org>
 <20190409095503.GB32344@atrey.karlin.mff.cuni.cz>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <66bafd50-1599-db70-99da-e7f5877281c2@collabora.com>
Date:   Mon, 3 Jun 2019 18:35:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190409095503.GB32344@atrey.karlin.mff.cuni.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,

On 9/4/19 11:55, Pavel Machek wrote:
>> The EC is in charge of controlling the keyboard backlight on
>> the Wilco platform. We expose a standard LED class device at
>> /sys/class/leds/chromeos::kbd_backlight. This driver is modeled
> 
> As discussed, please use platform::.
> 

Last time I looked at this patch there were some work and discussion ongoing
about led naming in led ML, did the discussion end? I'm not able to find if
there is a final agreement.

Thanks,
 Enric

> 								Pavel
> 
