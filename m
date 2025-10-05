Return-Path: <linux-leds+bounces-5644-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D68BB9A9E
	for <lists+linux-leds@lfdr.de>; Sun, 05 Oct 2025 20:07:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C32FD3A8635
	for <lists+linux-leds@lfdr.de>; Sun,  5 Oct 2025 18:07:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70C71CAA6C;
	Sun,  5 Oct 2025 18:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Y/NlnARv"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6242D1527B4;
	Sun,  5 Oct 2025 18:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759687662; cv=none; b=ZpZVh5DH9amF2zYGwYhdI2xMMLEhXn1pX1E1k1BJCm2X4YwfJw6H8+oj7/7w1rHzS2/Fvaz1oRgnEvIG6xFSxf9CLb2hpZfglkCD+yN5YrYmdskFhFCOfbKPyJE2FbeFgGPygBV/mJcXl/qRLL52nRxuMyu5yx2dXb4eSZbmtB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759687662; c=relaxed/simple;
	bh=1m0zka4HmlEfPWNXg0FcrwdptiAoHFHl2EJ+StFUWpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z5VoP+tV3XErMwpZfE4DLMCKAVn67rGF0RW37956unVMSvDHeFmxuwrp4CQlJ1aSU7zl+Z93z1hF8E35W8oClsVbW+DujDV82qqf1YVk/FpvS2mFHa/Awao7JVDzN7rkHXfci8DTfUy8TwBeWl2jQKDgLuU6ZCkQ5W+Ov6FJkR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Y/NlnARv; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1759687622; x=1760292422; i=w_armin@gmx.de;
	bh=QH7ZgdXsqp0oVysovEXrIBx0PnZ068GgPLMZb5Hm4iQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Y/NlnARvoL1GEq0QO98zSTwREj+caaT5ncR3zbNcLDDV1Oloe/Z4olEwY8d4bWI7
	 pWoyCbsyBqYIoEPQYQjqLU5NDLyYla/4otPwXCdRGPYpdv4yDD0yVDUAJr4K7f4zB
	 TbjV/d/r7r7WasHD7+lo2pQ/Kd/KoljwqitF4MX0XaxRZOO/GkOgOH4rIgLnAfZi/
	 FpZwQtlE4wSGLYlftw8YdKSlKIGMQn8+ZanC0QVkt8MeoFOwxOfXINx0o4346FzRe
	 9xFceM22yLlswc54lFVc2n28gf1uPPRday1cpjCX2M8Xvz9ni+e2POaRE8REhE6+s
	 hB3Yb5AQeFtgTsNRqg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N9Mta-1uBFvW0IVg-010ylw; Sun, 05
 Oct 2025 20:07:02 +0200
Message-ID: <402f254d-7217-43e8-867f-66daab3ead86@gmx.de>
Date: Sun, 5 Oct 2025 20:06:57 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] platform/x86: Add Uniwill laptop driver
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 wse@tuxedocomputers.com, ggo@tuxedocomputers.com, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 rdunlap@infradead.org, alok.a.tiwari@oracle.com, linux-leds@vger.kernel.org,
 lee@kernel.org, pobrn@protonmail.com
References: <20250928013253.10869-2-W_Armin@gmx.de>
 <202509290415.uez00SgW-lkp@intel.com>
 <6146d57b-f855-40b1-a644-3af6b28ceea4@gmx.de>
 <20251002233627.GA3978676@ax162>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20251002233627.GA3978676@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:i9hAnnOb+ZKFafIH75xfSC/KubP2Pn5uEXKvhk4Dd+/8I4t/4kn
 U1baE1bvWX3vUKzYzZEvWnSATaSe79Fc0j3AmUJZoUxGZTbDxFp6fRZl0qA0Ov93tU5R0lX
 g7ONpr8coY045ST1SphDLIvZAZ9yQvFvEtE9Fo6e1++83wKHMbp13Pm5Ljgzq2ATGMIChpa
 5mCYrSKpkOGq3beOOxGsQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7W9t5KsDQgU=;re7ApoQUoV477om9cEIhbZ39BTj
 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

Am 03.10.25 um 01:36 schrieb Nathan Chancellor:

> Hi Armin,
>
> On Thu, Oct 02, 2025 at 08:41:19PM +0200, Armin Wolf wrote:
>> i think this is a problem inside the clang compiler. I did not encounte=
r this warning when
>> build for x86-64 using gcc.
> Clang is actually saving you from yourself, it is a bug in GCC that it
> does not warn for this:
>
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D91951

Oh my, i didn't expect that. Thank you for explaining this issue to to me,
it seems that i still have much to learn.

Thanks,
Armin Wolf

>>> vim +1243 drivers/platform/x86/uniwill/uniwill-acpi.c
>>>
>>>     1235=09
>>>     1236	static int uniwill_notifier_call(struct notifier_block *nb, u=
nsigned long action, void *dummy)
>>>     1237	{
>>>     1238		struct uniwill_data *data =3D container_of(nb, struct uniwil=
l_data, nb);
>>>     1239		struct uniwill_battery_entry *entry;
>>>     1240=09
>>>     1241		switch (action) {
>>>     1242		case UNIWILL_OSD_BATTERY_ALERT:
>>>> 1243			guard(mutex)(&data->battery_lock);
> mutex_unlock() will be called on &data->battery_lock even when the
> default case is taken, as demonstrated by the following test case.
>
>>>     1244			list_for_each_entry(entry, &data->batteries, head) {
>>>     1245				power_supply_changed(entry->battery);
>>>     1246			}
>>>     1247=09
>>>     1248			return NOTIFY_OK;
>>>     1249		default:
>>>     1250			guard(mutex)(&data->input_lock);
>>>     1251			sparse_keymap_report_event(data->input_device, action, 1, t=
rue);
>>>     1252=09
>>>     1253			return NOTIFY_OK;
>>>     1254		}
>>>     1255	}
>>>     1256=09
>>>
> $ cat test.c
> #include <stdio.h>
>
> void cleanup_1(int *a) { printf("+ %s(%p)\n", __func__, a); }
> void cleanup_2(int *a) { printf("+ %s(%p)\n", __func__, a); }
> void cleanup_3(int *a) { printf("+ %s(%p)\n", __func__, a); }
>
> void no_scopes(int a)
> {
>      printf("%s(%d)\n", __func__, a);
>      switch (a) {
>      case 1:
>          int case_1 __attribute__((cleanup(cleanup_1)));
>          return;
>      case 2:
>          int case_2 __attribute__((cleanup(cleanup_2)));
>          return;
>      default:
>          int case_default __attribute__((cleanup(cleanup_3)));
>          return;
>      }
> }
>
> void with_scopes(int a)
> {
>      printf("%s(%d)\n", __func__, a);
>      switch (a) {
>      case 1: {
>          int case_1 __attribute__((cleanup(cleanup_1)));
>          return;
>      }
>      case 2: {
>          int case_2 __attribute__((cleanup(cleanup_2)));
>          return;
>      }
>      default: {
>          int case_default __attribute__((cleanup(cleanup_3)));
>          return;
>      }
>      }
> }
>
> int main(void)
> {
>      no_scopes(1); printf("\n");
>      no_scopes(2); printf("\n");
>      no_scopes(3); printf("\n");
>
>      with_scopes(1); printf("\n");
>      with_scopes(2); printf("\n");
>      with_scopes(3);
> }
>
> $ gcc -O2 test.c
>
> $ ./a.out
> no_scopes(1)
> + cleanup_1(0x7ffea3450c0c)
>
> no_scopes(2)
> + cleanup_2(0x7ffea3450c10)
> + cleanup_1(0x7ffea3450c0c)
>
> no_scopes(3)
> + cleanup_3(0x7ffea3450c14)
> + cleanup_2(0x7ffea3450c10)
> + cleanup_1(0x7ffea3450c0c)
>
> with_scopes(1)
> + cleanup_1(0x7ffea3450c14)
>
> with_scopes(2)
> + cleanup_2(0x7ffea3450c14)
>
> with_scopes(3)
> + cleanup_3(0x7ffea3450c14)
>
> $ clang -O2 test.c
> test.c:12:9: warning: label followed by a declaration is a C23 extension=
 [-Wc23-extensions]
>     12 |         int case_1 __attribute__((cleanup(cleanup_1)));
>        |         ^
> test.c:15:9: warning: label followed by a declaration is a C23 extension=
 [-Wc23-extensions]
>     15 |         int case_2 __attribute__((cleanup(cleanup_2)));
>        |         ^
> test.c:18:9: warning: label followed by a declaration is a C23 extension=
 [-Wc23-extensions]
>     18 |         int case_default __attribute__((cleanup(cleanup_3)));
>        |         ^
> test.c:17:5: error: cannot jump from switch statement to this case label
>     17 |     default:
>        |     ^
> test.c:15:13: note: jump bypasses initialization of variable with __attr=
ibute__((cleanup))
>     15 |         int case_2 __attribute__((cleanup(cleanup_2)));
>        |             ^
> test.c:12:13: note: jump bypasses initialization of variable with __attr=
ibute__((cleanup))
>     12 |         int case_1 __attribute__((cleanup(cleanup_1)));
>        |             ^
> test.c:14:5: error: cannot jump from switch statement to this case label
>     14 |     case 2:
>        |     ^
> test.c:12:13: note: jump bypasses initialization of variable with __attr=
ibute__((cleanup))
>     12 |         int case_1 __attribute__((cleanup(cleanup_1)));
>        |             ^
> 3 warnings and 2 errors generated.
>
> https://godbolt.org/z/1Tx7Gj1xf
>
> I would add the scoping to the case labels or use scoped_guard() to
> avoid this, which would also avoid the instances of -Wc23-extensions.
>
> Cheers,
> Nathan
>

