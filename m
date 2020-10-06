Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE56284B3C
	for <lists+linux-leds@lfdr.de>; Tue,  6 Oct 2020 14:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgJFMAA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 6 Oct 2020 08:00:00 -0400
Received: from w1.tutanota.de ([81.3.6.162]:48786 "EHLO w1.tutanota.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726123AbgJFMAA (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 6 Oct 2020 08:00:00 -0400
Received: from w3.tutanota.de (unknown [192.168.1.164])
        by w1.tutanota.de (Postfix) with ESMTP id 01CBBFA00CD;
        Tue,  6 Oct 2020 11:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1601985597;
        s=s1; d=tutanota.com;
        h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
        bh=eltae3HoBYMjsE66URtFxvFlqumsCh3qkPeDnLne2qI=;
        b=aDZcpUr6utvoZZIyEaLQi9roRWGZVSD5O2iymFuscOX6D524owNwxeU+mvMcni6u
        pzOSVokopJAlDNRAZJ2Yr5Z8slGFsJquQNp2cUxYxBHMSPJRIivRyWdhOD8vjNDd2Wx
        ZVL0Icg/zftENBZuIY8C9D086vZp6FQvI8GTH8k8NPLjSY92Q9hq5rYyAobWiQWI0XX
        s3Ha4GqUtuytEEjUJ92u4xjMMTKkOk2B8OR5JOnaEf3Y6eof8coTYoOiKa3u0ZKXkL5
        GIh4ig0KJo5yNnqhIQTpP/khNp9dZKGuPUupA7VYi35Gb+FsHqdSBcdM5/ZRrrIpKma
        t/BM5EUB/Q==
Date:   Tue, 6 Oct 2020 13:59:57 +0200 (CEST)
From:   ultracoolguy@tutanota.com
To:     Marek Behun <kabel@blackhole.sk>
Cc:     Pavel <pavel@ucw.cz>, Dmurphy <dmurphy@ti.com>,
        Linux Leds <linux-leds@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Message-ID: <MIxm3uX--3-2@tutanota.com>
In-Reply-To: <20201006093356.6d25b280@blackhole.sk>
References: <20201005141334.36d9441a@blackhole.sk> <MIt2NiS--3-2@tutanota.com> <3c5fce56-8604-a7d5-1017-8a075f67061e@ti.com> <MItBqjy--3-2@tutanota.com> <966c3f39-1310-dd60-6f33-0d9464ed2ff1@ti.com> <MItOR9Z--3-2@tutanota.com> <20201005164808.slrtmsvmw4pvwppm@falbala.internal.home.lespocky.de> <MItjEho--3-2@tutanota.com> <20201005173227.GA6431@duo.ucw.cz> <20201006093356.6d25b280@blackhole.sk>
Subject: Re: [PATCH] leds: lm3697: Fix out-of-bound access
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

While I do agree with you that having the child nodes be led strings make more sense, would it be possible to have, for example, three strings controlled by the same label?

Oct 6, 2020, 07:33 by kabel@blackhole.sk:

> By the way I just realized that the DT binding in this driver seems
> incorrect to me.
>
> The controller logically supports 3 LED strings, each having
> configurable control bank.
>
> But the DT binding supports 2 DT nodes, one for each control bank
> (identified by the `reg` property) and then `led-sources` says which
> string should be controlled by given bank.
>
> But taking in mind that DT should describe how devices are connected to
> each other, I think the child nodes in the binding should instead
> describe the 3 supported LED strings...
>
> Marek
>

