Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 891EA2311EF
	for <lists+linux-leds@lfdr.de>; Tue, 28 Jul 2020 20:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729199AbgG1Sre (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 28 Jul 2020 14:47:34 -0400
Received: from mout.gmx.net ([212.227.17.22]:34695 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729005AbgG1Srd (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 28 Jul 2020 14:47:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1595962052;
        bh=bKIR/ECQqrXDShzFUESdOf0WYZ27UPEFoEqt55tPFhY=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=ObtLNzJ++Qa4lyjVQzeUcA608OpuAYGPNxXCORqAznA7ahEMB85vBfLSI4FGVg4Ax
         jsvKUpqHpCSpFmxVqHmUUlUatJNFfsdUf9m/1xoxNmAGHRQBiEvex54tJedcdKrCX8
         kt4Up5y8VZyYcIWccpCdjqqO/WUkaN6ePMSQqCjs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [188.192.120.146] ([188.192.120.146]) by web-mail.gmx.net
 (3c-app-gmx-bap12.server.lan [172.19.172.82]) (via HTTP); Tue, 28 Jul 2020
 20:47:32 +0200
MIME-Version: 1.0
Message-ID: <trinity-ff7f1644-b76d-424b-9a6f-8caaf9961ffe-1595962052162@3c-app-gmx-bap12>
From:   truart@gmx.de
To:     linux-leds@vger.kernel.org
Subject: led block trigger patch
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 28 Jul 2020 20:47:32 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:NN3lEdNYHr791c5f25zkMf2IHxk+/W9XBTdLIlgGrliGnTrjGZUbW2pmOpfA55hcUscND
 1wJ5BmI0TcL7+wFnMptoL3hGhsSDuDp9tT3yzEYRPuT5ol+e0tVdCfcIcAxbjUS9Au6N6zlz56Mh
 1gvLIzKuDKCgkmdBpkWeQyCroG4WJfpMkBZ84zVSL8uZT8tbL6kRMrOe9iYuDaU06O2jis8DXz2Y
 WICwIf/bSoo08B7mSu1eeIbAIm0TB7g7/Ao2xh9ijDPYo1HcNzh8Gfhpf3A4sRKOmQjtK7V/UrSH
 Rc=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LVas9VvHxB0=:l/8rqdJd8SV+UTXPeTVTeU
 ze+IQshw8Iq6mvWWyypuGb2n69yX1bjHlZq7sudIFaE/tQNI7vn/Lx9P9vFeva1WDyeXCAh6m
 i0Rwh/aCd+B8q4lOCd7IWAy5e8ntkRHwBgEaiBZ8C7pUrDxigxJdbQ1+pRIcrVzL5UrhOqtYj
 t5/GqKj/1QsCS4hUMgha8eLprcoG/f1/mBVmGAUsWp4BCJ+h355pHXF9dDzVUyNU58xr7fUsk
 7mbcCT0uIecE43Klc0HKGbtyw6kOAaFGfMcF141MIO1pEQ5TEupNUsQpLE0KM3kj9BYtQzBdt
 8brQJ7rzuROgLDJfLPvh3lFPb8Dsk5t8uXVed9jQ99mVcyNMt5grflRpCYnG6/4ECs1E+Rjic
 cWVJICHHqvtM6LNNZatkSsmRo22zt13Mqj0xFJ6EdOJrL1hNbsMSMtHfoPzkFngCI7FDMzHKC
 hVMUVkx2YsCt7XO1P1hKYLNP70F01Is4Lh9JqPQlyRt+xUO23UDxXxsVq+QnXc4QcmxqnoCoA
 Ng3jercsEUeGBp/BvXaXNZpmRf46wf7Q1G6gGSsJquf5RiqB2/ndiBO/kxQIs8T2jqKQat0Hp
 4O6YfIHLWUI/P6EnKQlQ9kG5qyi6Uf7xCYavAe8r7gS+tX3XyxZK3eNA/sxQpglTJQH5eIJ9j
 tPTJRUTQMCYfNUdRh5l4nlWz1OAX9oD8gX8n5TGeYUgi1Ow==
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hej hej,

I already asked on the linux-block list, but that was likely the wrong place, so I try here.

All our new thinkpads are missing a hard disk led, and when trying to use some keyboard led it turned out that this is not really working. The LED is either just blinking or showing nothing. When googling we found https://www.spinics.net/lists/linux-scsi/msg132286.html
All the laptops have nvme disks, so this is exactly what we need. But it seems to be missing in the latest kernel.

So may I ask what happened to this patch? Is it scheduled for being added? It's definitely needed as every new notebook I'm aware of doesn't have hard disk leds while nvme disks are default for most new notebooks now. So linux should be able to show disk traffic not only for ide and sata but also for up-to-date disk technologies. Any chance we get that patch? Is there a place to vote for a patch?

Thanks!
Michael
