Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 662E43AA041
	for <lists+linux-leds@lfdr.de>; Wed, 16 Jun 2021 17:45:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235296AbhFPPrN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 16 Jun 2021 11:47:13 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:57399 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235402AbhFPPpl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 16 Jun 2021 11:45:41 -0400
Received: from [192.168.1.155] ([95.115.35.150]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mrwnt-1lZ4S429yP-00nzvC; Wed, 16 Jun 2021 17:43:29 +0200
Subject: Re: [PATCH v2] platform/x86: add support for Acer Predator LEDs
To:     leo60228 <leo@60228.dev>, hdegoede@redhat.com,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
References: <20210615221931.18148-1-leo@60228.dev>
 <20210616005147.26212-1-leo@60228.dev>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <87e6f17f-3d82-ac63-b5eb-e7f3205f59e8@metux.net>
Date:   Wed, 16 Jun 2021 17:43:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210616005147.26212-1-leo@60228.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OLLLXc+WSnGNBPZPpha5mKKpqiZhNlEyv0CwJhuKp/T5mRwWwDU
 6+6mSdIMhKmZnlaW9TtM8QyXKhUrRaHkIdYV4ylh67UR5mupYnM7ZwnPUeqygRUtLkizEr5
 hPJkNLvMkWk0c8OuRmswszxB9r5UXEMUswWqN+Uut+04CfGRsBh5kesZ3N92AtQKjMVTUvR
 ZYjwZOr/MFbdOK6+puSjA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jXooWUNtLj0=:XrpkodD2tDALMFzED6IHBn
 TELovewKIJcdPk7Bg1gN7wdsKO97y5G2Ef1vksWhi4L1fBuwT3rNq0BBColPnWU8n5X2IQwRe
 HBXZd72sMxqmFv+3/HYqILAZy+2dThV+ym0oD2pjF5GIqX38AbxfK/xd0lOPu01pXfVSQBAyN
 l0gA3crsBc8A2XUtn+xZwWOaqvEpr+5jHKT/qHx7bVnwiPWI6V0cA1vR1snceWXmuaJx1krCu
 txqZ0zHeJ6QZZvJJEu5Sj+sj3Fu22vUK95UgouURExOvoQEE/fKh4bTQHE0njg5YEc9iXd5jq
 bTC8GRYLoVB7hjJI+kUL9D8nFJiYM9jUQ389xcznEChZCvLrnhoeP0yhpaBdt9h9QvioBXzoy
 AQ/QH7M8ZNAHo9eLYIu7SI4DTR79CJKm7fxD2Ryp82rRHPvxxxTZGqml2sOhOzkrx2X7kR8mJ
 szyfhUcXRYYu3eQtMtmNLOWpAOnfffLjLQXo1pnvhI0S5gCDJ56f3oPVMDU3RQ2MjrsTP8+DD
 dLUi7A0OIrUb4FAK1gVnKw=
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On 16.06.21 02:51, leo60228 wrote:
> The Acer Predator Helios 500's keyboard has four zones of RGB LEDs.
> 
> This driver allows them to be controlled from Linux.

Can you please tell a bit more what these LEDs are actually used for ?
Do they have some names or symbols ? Are they also controlled by
something else (e.g. numlock or shiftlock leds)


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
