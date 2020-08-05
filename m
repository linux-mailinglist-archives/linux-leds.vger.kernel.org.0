Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C93523D3C2
	for <lists+linux-leds@lfdr.de>; Thu,  6 Aug 2020 00:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbgHEWCp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 5 Aug 2020 18:02:45 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:56934 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726422AbgHEWCo (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 5 Aug 2020 18:02:44 -0400
X-Greylist: delayed 345 seconds by postgrey-1.27 at vger.kernel.org; Wed, 05 Aug 2020 18:02:44 EDT
Received: by mail.z3ntu.xyz (Postfix, from userid 182)
        id 32292C5184; Wed,  5 Aug 2020 21:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1596664618; bh=NuNyAs9jR4nNycuJMOPU4mJBO5vKUuhZe/x2ivQcxFY=;
        h=From:To:Subject:Date;
        b=Zn334Py/2GCmMw5XNapaS8BMynlRWRw0BrEgwqWUbTx2OXPMMJgbJQLjufFnRk5XO
         Guuq1j80FUVG3AbKQNkT3jq+z5+qq1/m1WHyKpRQRqT5YAwd5ZknJ8sxzmavJdEREi
         a9hzntzJ6+9fm9ICVKyAxpRpfh9Ue56BCeRYiWI0=
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on arch-vps
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        FROM_SUSPICIOUS_NTLD_FP,PDS_OTHER_BAD_TLD,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.4
Received: from g550jk.localnet (80-110-125-173.cgn.dynamic.surfer.at [80.110.125.173])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 76002C4CBD
        for <linux-leds@vger.kernel.org>; Wed,  5 Aug 2020 21:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1596664616; bh=NuNyAs9jR4nNycuJMOPU4mJBO5vKUuhZe/x2ivQcxFY=;
        h=From:To:Subject:Date;
        b=HfCJFp11cYzsFwusQHj3d7553oad9jt3xysQBairE5Ujfn18vCaqqNKaR2eJhG8hP
         Taq0+EoFmA/rowuEcH5L9ZHpUvjaZv8GybHHPtXtQQbP4JjW2Zu+AE7yR6fofCpQgF
         KUBipiFR5vGrNEXRak+0mmFK7F7EMNwFwS2ih2Bo=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-leds@vger.kernel.org
Subject: Multicolor leds-gpio
Date:   Wed, 05 Aug 2020 23:56:55 +0200
Message-ID: <2530787.iFCFyWWcSu@g550jk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,
would it be possible to make the leds-gpio driver compatible with the new 
multicolor framework for a light that's composed of 3 leds (red, green, blue) 
and where each led is controlled via a gpio (so it can produce 8 different 
colors)? As far as I can tell leds-gpio is too generic to support that but 
please correct me if I'm wrong. What's the way forward here for this use case? 
The same probably also applies to leds-pwm.
Regards
Luca


