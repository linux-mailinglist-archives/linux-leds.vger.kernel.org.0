Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 673C869577
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jul 2019 16:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391188AbfGOO5n (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Jul 2019 10:57:43 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:39271 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391156AbfGOO5n (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Jul 2019 10:57:43 -0400
Received: from orion.localdomain ([95.118.111.244]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MD9Kp-1heY5r1xHV-0099xY; Mon, 15 Jul 2019 16:57:38 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        linux-leds@vger.kernel.org
Subject: leds: apu: drop obsolete support for apu>=2
Date:   Mon, 15 Jul 2019 16:57:27 +0200
Message-Id: <1563202653-20994-1-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
X-Provags-ID: V03:K1:bjFr0P34zwiwycyYooXN3gJkPyUMnzKh8TAai8QjjD7P+jPKx2y
 WyKnPaduPkTjD8w6/TIxmlobgiDmXFHOT8h9wdFt/oZwF7WxTUNrspQjz+P2jrMyir7Suy8
 KI+IDFa1BKa+EfmK/h/AE/sEmU6/EM1Q6eCstSEtXOFO3wVRSdFfx9PP6R1gnMlfZkloJOr
 kHWimJpwyN9TrpKaKuhiA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:brXsJ+7J2ag=:2Hrh3GyFKmNSrBJg7E8a4q
 31jgTlWMxMfuJDca2c/SDY4UME51Eb10rP7k5uv2H7Z3HgpTSCkTnD8DCJ/sDETOx6GeaFDDl
 YFCB59of1eEO2OB8lO/ucdtlC2CbndegoYCEJ6dpL2kqwRyqRmC7h+50UdF2CKGwX0svHLpg7
 kFk4TbnEnU4e2S+hCAVcqWfM/qbSAAgEJYDJphahDJFe+ttVwoc16To2UBpG8pvtI737NKEx/
 jGDFAD75aOd/Rm0fCZsfgtopDTO/O4p+4Wtu1CUbaurB2OsQihFskYpLRAfwBsQT251D4soPp
 6zeLk62VBrCb6b9yHdpwgb9+d7Tw6HWITEl+DqRwr31i+9Ne6mQq9BBWXB6yrSZ3E8Hp5mOvp
 1HV3RVm3tAfrHMkIPdcEsbkgqzKOnNiM040LWZu8fGTPrUGIktnbWdRWhwhvACkbtJMCxNWWL
 lF7C69uSsBlW4Xy2DySzrbBJIRliRDDaiG5fziYiS5YBqYaUv0GPoME6qtPxJ9bJp9emugzyZ
 rE/EJ4xEYSJhRXCDALU7R0kNBDNFjfvM7/rJeLnlipfadZJmaOjkyEsX/l9KNxkHCxf+d2Vhy
 1Ibpq0VWp9NhDIO5JvyUYma8CZ+hdKadr3DarT19RXrZsQPYE39TvNZx5NkviduppU/tMubnC
 jB+k/49L824fPF5+hno9evc5XGLVoz/97TDdHDLfZhf0e1djMWNAaG7BbwKoe2drmOEk0Eaw0
 SAtKm9fSIvkwCEj1gKIcndoNFF4s7hweWOcpbQ==
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi folks,


the legacy apu LEDs driver has been superseded by the more complete
pcengines-apu2 platform driver, for APU >= 2. It only supports
the three front LEDs, but lacks all the other GPIOs (eg. button
or simsw), and conflicts with the pcengines-apu2 driver.

Old APUv1 has a very different chipset.

Therefore I propose dropping the apu>=2 support from the legacy
driver, reducing it to only the old (obsolete) APUv1 boards.


--mtx


