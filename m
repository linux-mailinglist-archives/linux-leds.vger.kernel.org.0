Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2FEC3489DD
	for <lists+linux-leds@lfdr.de>; Thu, 25 Mar 2021 08:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbhCYHLR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 25 Mar 2021 03:11:17 -0400
Received: from us-smtp-delivery-115.mimecast.com ([170.10.133.115]:49798 "EHLO
        us-smtp-delivery-115.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229508AbhCYHLQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Thu, 25 Mar 2021 03:11:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxlinear.com;
        s=selector; t=1616656275;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=/kq4s5i70eSEKl4QNkmI87USHq75zdhgWwSGGIA1HY4=;
        b=alXW3KlU14N+l1nMoetASUDY/t+FkmJ0RxW2fu9wSlo3pqP3uQAg39+HypSlzsSuLdE6Qs
        jJA9AmQvomz4726Cfre4K+4yQgAD3eXBK41j9nF7p+urOjB46R7UJ/F085cs3znu2GBCpy
        bfx9nXz2JNHdh51QddxVXS8q6jeV5o0=
Received: from mail.maxlinear.com (174-47-1-83.static.ctl.one [174.47.1.83])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-s9z1od6YMJeNe3i-Ivcd0Q-1; Thu, 25 Mar 2021 03:11:13 -0400
X-MC-Unique: s9z1od6YMJeNe3i-Ivcd0Q-1
Received: from sgsxdev001.isng.phoenix.local (10.226.81.111) by
 mail.maxlinear.com (10.23.38.120) with Microsoft SMTP Server id 15.1.2176.2;
 Thu, 25 Mar 2021 00:11:09 -0700
From:   Rahul Tanwar <rtanwar@maxlinear.com>
To:     <pavel@ucw.cz>
CC:     <arnd@kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kilobyte@angband.pl>,
        <rafael.j.wysocki@intel.com>, <john@phrozen.org>,
        <hmehrtens@maxlinear.com>, <ckim@maxlinear.com>,
        <qwu@maxlinear.com>, Rahul Tanwar <rtanwar@maxlinear.com>
Subject: [PATCH v2 0/1] leds: lgm: Address review concerns
Date:   Thu, 25 Mar 2021 15:11:07 +0800
Message-ID: <cover.1616655898.git.rtanwar@maxlinear.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUSA115A51 smtp.mailfrom=rtanwar@maxlinear.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: maxlinear.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Address below review concerns from Pavel:
1. Remove LEDS_BLINK Kconfig symbol.
2. Provide useful Kconfig help text for the driver.

This patch is based on "for-next" branch of kernel from below git tree:
git git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git for-=
next

v2:
- Fix few code quality related review concerns (Randy Dunlap).
- Further improve Kconfig help text (Pavel).
- Switch back to original copyright (pavel).

v1:
- Initial version.

Rahul Tanwar (1):
  leds: lgm: Improve Kconfig help

 drivers/leds/Kconfig              |  5 ++---
 drivers/leds/Makefile             |  2 +-
 drivers/leds/blink/Kconfig        | 28 +++++++++++++---------------
 drivers/leds/blink/Makefile       |  2 +-
 drivers/leds/blink/leds-lgm-sso.c |  4 ++--
 5 files changed, 19 insertions(+), 22 deletions(-)

--
2.17.1

________________________________

This electronic mail (including any attachments) may contain information th=
at is privileged, confidential, and/or otherwise protected from disclosure =
to anyone other than its intended recipient(s). Any dissemination or use of=
 this electronic mail or its contents (including any attachments) by person=
s other than the intended recipient(s) is strictly prohibited. If you have =
received this message in error, please notify us immediately by reply e-mai=
l so that we may correct our internal records. Please then delete the origi=
nal message (including any attachments) in its entirety.

